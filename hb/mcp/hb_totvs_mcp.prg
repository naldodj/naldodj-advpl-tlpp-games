/*

 _      _         _           _
| |__  | |__     | |_   ___  | |_ __   __ ___     _ __ ___    ___  _ __
| '_ \ | '_ \    | __| / _ \ | __|\ \ / // __|   | '_ ` _ \  / __|| '_ \
| | | || |_) | _ | |_ | (_) || |_  \ V / \__ \ _ | | | | | || (__ | |_) |
|_| |_||_.__/ (_) \__| \___/  \__|  \_/  |___/(_)|_| |_| |_| \___|| .__/
                                                                  |_|
stdio MCP support

Ref.: FiveTech Software tech support forums
Post by Antonio Linares => Sun Apr 20, 2025 1:54 pm
https://forums.fivetechsupport.com/viewtopic.php?p=279038&fbclid=IwY2xjawJuYexleHRuA2FlbQIxMAABHs9xck4cJElRsb8JNH8mCYB4npX7bymu-7yVGDbWrVNyno4M7j9A3CxP-_zL_aem_IfLRzD3kMCei7UE5CHYsYA#p279038

Ref.: //https://code.visualstudio.com/docs/copilot/chat/mcp-servers

Released to Public Domain.
--------------------------------------------------------------------------------------

*/

/* Keeping it tidy */
#pragma -w3
#pragma -es2

/* Optimizations */
#pragma -km+
#pragma -ko+

#include "hblog.ch"
#include "inkey.ch"
#include "fileio.ch"
#include "hbinkey.ch"

#define SW_HIDE             0
#define SW_SHOWNORMAL       1
#define SW_NORMAL           1
#define SW_SHOWMINIMIZED    2
#define SW_SHOWMAXIMIZED    3
#define SW_MAXIMIZE         3
#define SW_SHOWNOACTIVATE   4
#define SW_SHOW             5
#define SW_MINIMIZE         6
#define SW_SHOWMINNOACTIVE  7
#define SW_SHOWNA           8
#define SW_RESTORE          9

static s__cLogFileName as character

REQUEST hb_DirBuild
REQUEST hb_DirExists
REQUEST hb_DirCreate
REQUEST hb_DirSepAdd
REQUEST hb_DirSepToOS
REQUEST hb_FNameName
REQUEST hb_FNameNameExt

procedure Main()

    local cInput as character
    local cCurDir as character
    local cResponse as character
    local cIniFileName as character
    local cExeFileName as character

    local cMCPIODir as character
    local cFileMsgIN as char
    local cFileMsgOUT as character
    local cFileServerStop as character

    local hIni as hash

    local nAttempts as numeric
    local nAttemptIdle as numeric

    local nKoef as numeric
    local nStyle as numeric
    local nSeverity as numeric
    local nFileSize as numeric
    local nFileCount as numeric
    local nFileSizeType as numeric

    ErrorBlock({|oError|LogFile("error",hb_JSONEncode(hb_DumpVar(oError,.T.,nil)),HB_LOG_ERROR)})

    cExeFileName:=hb_ProgName()
    cIniFileName:=hb_FNameName(cExeFileName)+".env"
    if (hb_FileExists("..\"+cIniFileName))
        cIniFileName:="..\"+cIniFileName
    endif

    cCurDir:=StrTran(StrTran(cExeFileName,hb_FNameName(cExeFileName),""),hb_FNameExt(cExeFileName),"")

    hIni:=hb_iniRead((cCurDir+cIniFileName),.F.,nil,.F.)

    s__cLogFileName:=hIni["HB_TOTVS_MCP"]["LOGFILE"]

    nStyle:=(HB_LOG_ST_DATE+HB_LOG_ST_ISODATE+HB_LOG_ST_TIME+HB_LOG_ST_LEVEL)
    nFileSize:=1
    nSeverity:=HB_LOG_DEBUG
    nFileCount:=5
    nFileSizeType:=2
    nKoef:=if((nFileSizeType==1),1,if((nFileSizeType==2),1024,(1024^2)))
    nFileSize:=(nFileSize*nKoef)

    INIT LOG ON FILE (nSeverity,s__cLogFileName,nFileSize,nFileCount)
    SET LOG STYLE (nStyle)

    nAttempts:=Val(hIni["HB_TOTVS_MCP"]["WAIT_FOR_AGENTS_TIMES"])
    nAttemptIdle:=Val(hIni["HB_TOTVS_MCP"]["WAIT_FOR_AGENTS_IDLE"])

    cMCPIODir:=hb_DirSepAdd(hb_DirSepToOS(hIni["HB_TOTVS_MCP"]["MCP_IO_DIR"]))

    if (!hb_DirExists(cMCPIODir))
        hb_DirBuild(cMCPIODir)
    endif

    cFileMsgIN:=hb_PathJoin(cMCPIODir,hb_FNameNameExt(hIni["HB_TOTVS_MCP"]["FILEMSGIN"]))
    cFileMsgOUT:=hb_PathJoin(cMCPIODir,hb_FNameNameExt(hIni["HB_TOTVS_MCP"]["FILEMSGOUT"]))
    cFileServerStop:=hb_PathJoin(cMCPIODir,hb_FNameNameExt(hIni["HB_TOTVS_MCP"]["FILESERVERSTOP"]))

    while (.T.)

        if (hb_FileExists(cFileServerStop))
            fErase(cFileServerStop)
            exit
        endif

        // Read input from standard input (stdin)
        // This is where the MCP server reads messages from stdin
        cInput:=StdIN()
        LogFile("StdIN",cInput)
        if (Empty(cInput))
           exit // Exit if no input (EOF)
        endif

        // Process the input message
        // This function handles the JSON-RPC message processing
        cResponse:=ProcessMessage(cInput,cFileMsgIN,cFileMsgOUT,cFileServerStop,nAttempts,nAttemptIdle)
        if (!Empty(cResponse))
            LogFile("StdOUT",cResponse)
            StdOUT(cResponse)
        endif

    end while

    LogFile("exit","finished")

    CLOSE LOG

    return

// Function to process JSON-RPC messages
static function ProcessMessage(cInput as character,cFileMsgIN as character,cFileMsgOUT as character,cFileServerStop as character,nAttempts as numeric,nAttemptIdle as numeric)

    local cMethod as character
    local cMessage as character
    local cResponse as character

    local hJSON as hash
    local hResponse as hash

    local nId as numeric
    local nAttempt as numeric

    // Decode JSON to obtain the method and ID
    hb_JSONDecode(cInput,@hJSON)
    cMethod:=Lower(allTrim(hJSON["method"]))

    LogFile("method",cMethod)

    if (hb_HHasKey(hJSON,"id"))
        nId:=hJSON["id"]
    endif

    hb_MemoWrit(cFileMsgOUT,cInput)

    hb_IdleSleep(nAttemptIdle)

    nAttempt:=0
    while (!hb_FileExists(cFileMsgIN))
        LogFile(cMethod,"Waiting for totvs to respond to `"+cMethod+"` request. Attempt: ["+hb_NToC(nAttempt)+"/"+hb_NToC(nAttempts)+"]")
        if (++nAttempt>=nAttempts)
            exit
        endif
        hb_IdleSleep(nAttemptIdle)
        if (hb_FileExists(cFileServerStop))
            exit
        endif
    end while

    if (hb_FileExists(cFileMsgIN))
        cMessage:=hb_MemoRead(cFileMsgIN)
        LogFile(cMethod,"totvs respond to `"+cMethod+"` request. Message: "+cMessage)
        if ((cMethod!="notifications/initialized").and.(!Empty(cMessage)))
            hb_JSONDecode(cMessage,@hResponse)
        endif
        fErase(cFileMsgIN)
    else
        LogFile(cMethod,"Error for totvs to respond to `"+cMethod+"` request")
        hResponse:={=>}
        hResponse["response"]:={=>}
        hResponse["response"]["jsonrpc"]:="2.0"
        hResponse["response"]["id"]:=nId
        hResponse["response"]["error"]:={;
            "code" => -32604,;
            "message" => "Method not found: " + cMethod;
        }

    endif

    if (((valType(hResponse)=="H").and.(hb_HHasKey(hResponse,"response"))))
        cResponse:=hb_JSONEncode(hResponse["response"])
        cResponse+=hb_eol()
    endif

    return(cResponse) as character

static procedure LogFile(cKey as character,cMessage as character,nSeverity as numeric)
    hb_default(@nSeverity,HB_LOG_DEBUG)
    LOG cKey+": "+cMessage PRIORITY nSeverity
    return

#pragma BEGINDUMP

    #include <hbapi.h>
    #include <shlobj.h>
    #include <windows.h>

    #pragma warning(disable:4312)

    HB_FUNC_STATIC(STDIN)
    {
        char buffer[1024];

        if (fgets(buffer,sizeof(buffer),stdin) != NULL)
        {
            // Remove final line break, if exists
            size_t len=strlen(buffer);
            if (len > 0 && buffer[len - 1]=='\n')
                buffer[len - 1]='\0';
            hb_retc(buffer);
        }
        else
        {
            hb_retc(""); // Return empty string in case of EOF
        }
    }

    HB_FUNC_STATIC(STDOUT)
    {
        if (HB_ISCHAR(1))
        {
            fputs(hb_parc(1),stdout);
            fflush(stdout); // Force immediate write
        }
    }

    HB_FUNC_STATIC(SHELLEXECUTEEX)
    {
        SHELLEXECUTEINFO SHExecInfo;

        ZeroMemory(&SHExecInfo,sizeof(SHExecInfo));

        SHExecInfo.cbSize = sizeof(SHExecInfo);
        SHExecInfo.fMask = SEE_MASK_NOCLOSEPROCESS;
        SHExecInfo.hwnd  = HB_ISNIL(1) ? GetActiveWindow() : (HWND) hb_parnl(1);
        SHExecInfo.lpVerb = (LPCSTR) hb_parc(2);
        SHExecInfo.lpFile = (LPCSTR) hb_parc(3);
        SHExecInfo.lpParameters = (LPCSTR) hb_parc(4);
        SHExecInfo.lpDirectory = (LPCSTR) hb_parc(5);
        SHExecInfo.nShow = hb_parni(6);

        if(ShellExecuteEx(&SHExecInfo))
            hb_retptr(SHExecInfo.hProcess);  // Retorna um ponteiro corretamente
        else
            hb_retptr(NULL);                 // Retorna NULL se falhar
    }

#pragma ENDDUMP
