import subprocess
import json

# Caminho do executável do MCP
mcp_path = r"C:\GitHub\naldodj-advpl-tlpp-games\hb\mcp\msvc64\hb_totvs_mcp.exe"

# Requisição para listar as ferramentas
request = {
    "method": "tools/list",
    "params": {}
}

# Inicia o processo MCP
proc = subprocess.Popen(
    [mcp_path],
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    text=True
)

# Envia a requisição via stdin
stdout, stderr = proc.communicate(json.dumps(request) + "\n")

print(stdout)
if stderr:
    print("Erros:")
    print(stderr)
