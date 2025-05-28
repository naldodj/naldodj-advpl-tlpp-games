import subprocess
import json
import sys

# Verifica se o argumento 'name' foi fornecido
if len(sys.argv) < 2:
    print("Uso: python script.py <nome_da_tool>")
    sys.exit(1)

tool_name = sys.argv[1]

# Caminho do executável do MCP
mcp_path = r"C:\GitHub\naldodj-advpl-tlpp-games\hb\mcp\msvc64\hb_totvs_mcp.exe"

# Requisição para executar a tool com o nome fornecido
request = {
    "method": "tools/call",
    "params": {
        "name": tool_name,
        "params": {}
    }
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

print("Resposta do MCP:")
print(stdout)
if stderr:
    print("Erros:")
    print(stderr)
