import tkinter as tk
from tkinter import messagebox
import os
import sys
import docker
import subprocess



# Conexxion al contenedor docker
client = docker.from_env()
# Función para llamar al contendor
# Obtener el contenedor por nombre o ID
try:
    contenedor = client.containers.get("routcort")
except docker.errors.NotFound:
    contenedor = None
    print("⚠️ Contenedor 'routcort' no encontrado.")


# Funciones para el funcionamiento de la api
def encender():
    encender_router = os.path.join('ejecutables', 'encender.sh')
    subprocess.run(['bash', encender_router])

    # Para modifificar estado
    ruta_estado = os.path.join('estado.txt')
    with open(ruta_estado, 'r') as estado:
        contenido = estado.read()
        contenido_modificado = contenido.replace('Apagado/', 'Encendido/')
    with open(ruta_estado, 'w') as estado:
        estado.write(contenido_modificado)
    
    
    python = sys.executable
    os.execl(python, python, *sys.argv)

def apagar():
    apagar_router = os.path.join('ejecutables', 'apagar.sh')
    subprocess.run(['bash', apagar_router])

    # Para modifificar estado
    ruta_estado = os.path.join('estado.txt')
    with open(ruta_estado, 'r') as estado:
        contenido = estado.read()
        contenido_modificado = contenido.replace('Encendido/', 'Apagado/')
    with open(ruta_estado, 'w') as estado:
        estado.write(contenido_modificado)

    with open(ruta_estado, 'r') as estado:
        contenido = estado.read()
        contenido_modificado = contenido.replace('/habilitado', '/deshabilitado')
    with open(ruta_estado, 'w') as estado:
        estado.write(contenido_modificado)

    python = sys.executable
    os.execl(python, python, *sys.argv)

def editar_cortafuegos():
    editar_cortafuegos = os.path.join('ejecutables', 'editar_cortafuegos.sh')
    subprocess.run(['bash', editar_cortafuegos])

    # Para modifificar estado
    ruta_estado = os.path.join('estado.txt')
    with open(ruta_estado, 'r') as estado:
        contenido = estado.read()
        contenido_modificado = contenido.replace('actualizado/', 'desactualizado/')
    with open(ruta_estado, 'w') as estado:
        estado.write(contenido_modificado)

    python = sys.executable
    os.execl(python, python, *sys.argv)

def editar_dhcp():
    editar_dhcp = os.path.join('ejecutables', 'editar_dhcp.sh')
    subprocess.run(['bash', editar_dhcp])

     # Para modifificar estado
    ruta_estado = os.path.join('estado.txt')
    with open(ruta_estado, 'r') as estado:
        contenido = estado.read()
        contenido_modificado = contenido.replace('desactualizado/', 'actualizado/')
    with open(ruta_estado, 'w') as estado:
        estado.write(contenido_modificado)

    python = sys.executable
    os.execl(python, python, *sys.argv)

def habilitar():
    script_path = "/scrip.sh"
    command = f"bash {script_path}"

     # Para modifificar estado
    ruta_estado = os.path.join('estado.txt')
    with open(ruta_estado, 'r') as estado:
        contenido = estado.read()
        contenido_modificado = contenido.replace('/deshabilitado', '/habilitado')
    with open(ruta_estado, 'w') as estado:
        estado.write(contenido_modificado)
    
    ruta_estado = os.path.join('estado.txt')
    with open(ruta_estado, 'r') as estado:
        contenido = estado.read()
        contenido_modificado = contenido.replace('desactualizado/', 'actualizado/')
    with open(ruta_estado, 'w') as estado:
        estado.write(contenido_modificado)

    contenedor.exec_run(command)
    exec_result = contenedor.exec_run(cmd=command, stdout=True, stderr=True)
    
    python = sys.executable
    os.execl(python, python, *sys.argv)
    # Mostrar salida
    print(exec_result.output.decode())
# Ventana principal
root = tk.Tk()
root.title("Router")
root.configure(bg="black")  # Fondo exterior negro
root.geometry("600x400")  # Tamaño inicial
# Estado
estado = tk.StringVar()
estado.set("")
def cargar_valor():
    try:
        with open('estado.txt', "r") as f:
            contenido = f.read().strip()  # Quita espacios y saltos
        estado.set(contenido)
    except FileNotFoundError:
        estado.set("")
cargar_valor()
# Marco principal blanco (relleno completo)
main_frame = tk.Frame(root, bg="white")
main_frame.pack(fill="both", expand=True, padx=5, pady=5)

# Título
title = tk.Label(main_frame, text="PINAT", font=("Helvetica", 20, "bold"), bg="white")
title.pack(pady=10)

# Línea negra horizontal
tk.Frame(main_frame, bg="black", height=2).pack(fill="x", padx=10, pady=5)

# Marco para las dos columnas
columns_frame = tk.Frame(main_frame, bg="white")
columns_frame.pack(fill="both", expand=True, padx=10, pady=10)

# POWER frame (izquierda)
power_frame = tk.Frame(columns_frame, bg="white", highlightbackground="black", highlightthickness=1)
power_frame.pack(side="left", fill="both", expand=True, padx=5)

tk.Label(power_frame, text="POWER", font=("Helvetica", 14, "bold"), bg="white").pack(pady=10)

tk.Button(power_frame, text="Encender", bg="lightblue", width=20, height=2, relief="solid", command=encender).pack(pady=10)
tk.Button(power_frame, text="Apagar", bg="lightcoral", width=20, height=2, relief="solid", command=apagar).pack(pady=10)

# CORTAFUEGOS frame (derecha)
firewall_frame = tk.Frame(columns_frame, bg="white", highlightbackground="black", highlightthickness=1)
firewall_frame.pack(side="left", fill="both", expand=True, padx=5)

tk.Label(firewall_frame, text="CORTAFUEGOS", font=("Helvetica", 14, "bold"), bg="white").pack(pady=10)

tk.Button(firewall_frame, text="Editar cortafuegos", bg="lightgreen", width=20, height=2, relief="solid", command=editar_cortafuegos).pack(pady=10)
tk.Button(firewall_frame, text="Editar servidor DHCP", bg="lightgreen", width=20, height=2, relief="solid", command=editar_dhcp).pack(pady=10)
tk.Button(firewall_frame, text="Habilitar", bg="khaki", width=20, height=2, relief="solid", command=habilitar).pack(pady=10)
# Línea divisoria negra inferior
tk.Frame(main_frame, bg="black", height=2).pack(fill="x", padx=10, pady=10)



estado_frame = tk.Frame(main_frame, bg="white", highlightbackground="black", highlightthickness=1)
estado_frame.pack(pady= 40, fill="x", padx=100)

tk.Label(estado_frame, text="Estado:", bg="white", font=("Helvetica", 12)).pack(side="left", padx=10, pady=5)
tk.Entry(estado_frame, textvariable=estado, state="readonly", width=80, relief="flat").pack(side="left", pady=5)

# Ejecutar
root.mainloop()
