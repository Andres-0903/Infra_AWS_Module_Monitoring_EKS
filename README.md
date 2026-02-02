# 📊🤖 Módulo de Monitoreo para Clusters EKS (AWS)

Este módulo de Terraform permite configurar **monitoreo avanzado para Amazon EKS** utilizando **Amazon CloudWatch**.
Incluye la creación de métricas, dashboards y alarmas para detectar fallos en nodos, pods y consumo de recursos.
Además, soporta integración con Amazon SNS para notificaciones automáticas.

---

## 🚀 Características principales

✔ Monitoreo completo de nodos y pods  
✔ Alarmas preconfiguradas para:

- CPU alta en nodos
- Memoria alta en nodos
- Pods fallidos (`pod_status_failed`)
- Nodos en estado no listo (`node_status_not_ready`)

✔ Soporte para múltiples clusters  
✔ Envío de notificaciones vía Amazon SNS  
✔ 100% gestionado como Infrastructure as Code (IaC)

---

## 📦 Requisitos

- Terraform `>= 1.0`
- AWS CLI configurado
- Permisos para crear:
  - CloudWatch Alarms
  - SNS Topics
  - IAM Roles si aplica
- EKS existente (mínimo un node group)

---

## 📥 Instalación

Agrega este bloque en tu archivo `main.tf` o `monitoreo.tf`:

```hcl
module "eks_monitoring" {
  source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EKS.git?ref=1.0.1"

  cluster_name = [
    "eks-dev",
    "eks-qa",
    "eks-prod"
  ]

  project        = var.project
  environment    = var.environment
  sns_topic_arn  = var.sns_topic_arn
}
```

---

## 🔧 Variables

| Variable        | Tipo        | Descripción                                       |
| --------------- | ----------- | ------------------------------------------------- |
| `cluster_name`  | set(string) | Lista de nombres de los clusters EKS a monitorear |
| `sns_topic_arn` | string      | ARN del tópico SNS para enviar alarmas            |
| `project`       | string      | Nombre del proyecto                               |
| `environment`   | string      | Ambiente (dev, qa, prod, etc.)                    |

Ejemplo de definición de variables:

```hcl
variable "project" {
  description = "Proyecto asociado al despliegue"
  type        = string
}

variable "environment" {
  description = "Ambiente donde se despliega"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN del SNS para notificaciones"
  type        = string
}
```

---

## 📤 Outputs

```hcl
output "alarms_created" {
  description = "Lista de alarmas creadas"
  value       = module.eks_monitoring.alarms_created
}
```

---

## 📘 Ejemplo completo

```hcl
module "eks_monitoring" {
  source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EKS.git?ref=1.0.1"

  cluster_name = [
    "eks-dev",
    "eks-qa",
    "eks-prod"
  ]

  project        = "Platform-team"
  environment    = "dev"
  sns_topic_arn  = aws_sns_topic.alerts.arn
}
```

---

## 🛠️ Comandos útiles

```bash
terraform init -upgrade
terraform validate
terraform plan
terraform apply
```

---

## 📄 Licencia

Este proyecto está bajo licencia MIT.  
Puedes usarlo libremente siguiendo las condiciones incluidas en el archivo `LICENSE`.

---

## 👨‍💻 Autor

**Giovanny Andrés Arenas García**  
Repositorio: https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EKS
