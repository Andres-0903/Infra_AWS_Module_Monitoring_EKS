## Modulo de monitoreo para instancias EKS

Modo de uso📣🤖
Este módulo de Terraform permite configurar el monitoreo de instancias EKS en AWS utilizando CloudWatch. Proporciona métricas y alarmas para asegurar que las instancias estén funcionando correctamente y para notificar sobre cualquier problema.

---

module "eks_monitoring" { source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EKS.git?ref=1.0.1"

cluster_name = var.cluster_name
sns_topic_arn = var.sns_topic

}

##

---👾🏆
