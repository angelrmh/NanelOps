# Despliegue en AWS de una instancia EC2 con SO Ubuntu usando Terraform como IaC

Esta es la configuración final para el proyecto de infraestructura TI para el despliegue de una instancia EC2 en AWS usando Terraform como IaC, en el proceso configuré los proveedores AWS y HTTP usados en terraform y también configuré una VPC (Red), un SG (Grupo de Seguridad), mi IP pública (para acceso de seguridad), key pair (llave de acceso SSH) y, por supuesto, una instancia EC2 con SO Ubuntu (VM Maquina Virtual).

Aquí encontrarán los archivos .tf (archivos de extensiones Terraform) por separado, esto lo realicé para un mejor entendimiento y para llevar un orden de configuración de la infraestructura, ya que Terraform tiene la capacidad de leer todos los archivos .tf contenidos en una carpeta por separado y ejecutarlos de manera correcta.

Para este projecto se usaron 2 proveedores para Terraform: AWS (como nuestro proveedor de cloud computing para este projecto), y HTTP (para ubicar nuestra IP pública con el fin de tener un mayor nivel de seguridad y limitar el acceso a nuestra instancia EC2 en AWS con la IP pública que tengamos en ese momento).

Se configuró una red (VPC) /16, con 2 zonas de disponibilidad (AZ) para alta disponibilidad, ambas AZ constan de 2 subnets (una pública y una privada) /19. Nuestra instancia EC2 estará configurada en la subnet privada.

Se configuró un Grupo de Seguridad (SG) para construir las reglas de acceso a nuestra instancia EC2 vía protocolos: http, https y ssh, y solo usuando la dirección IP pública que tenemos en ese momento.

Se configuró una llave de acceso ssh (key pair) para la instancia EC2.

Se configuró una máquina virtual (VM) o (instancia EC2) usando una imagen (AMI Amazon Machine Image) con SO Ubuntu. 

This is the final configuration for the IT infrastructure project to create an EC2 instance on AWS using Terraform as IaC, in the process I configured a providers AWS and HTTP used for terraform and also configured a VPC (Network), an SG (Security Group), my Public IP (for security access), key pair (SSH access key) and, of course, an EC2 instance with Ubuntu OS (Virtual Machine VM).

Here you will find the .tf files (Terraform extension files) separately, I did this for a better understanding and to keep an order of infrastructure configuration, since Terraform has the ability to read all the .tf files contained in a folder separately and execute them correctly.

For this project, 2 providers were used for Terraform: AWS (as our cloud computing provider for this project), and HTTP (to locate our public IP in order to have a higher level of security and limit access to our EC2 instance in AWS with the public IP that we have at that moment).

A /16 network (VPC) was configured, with 2 availability zones (AZ) for high availability, both AZs consist of 2 subnets (one public and one private) /19. Our EC2 instance will be configured in the private subnet.

A Security Group (SG) was configured to build access rules to our EC2 instance via protocols: http, https and ssh, and only using the public IP address we have at that moment.

An ssh passkey (key pair) has been configured for the EC2 instance.

A virtual machine (VM) or (EC2 instance) was configured using an image (Amazon Machine Image AMI) with Ubuntu OS.
