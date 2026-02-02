############
#Variables
############
variable "cluster_name" {
  description = "Nombre de los diferentes clusters"
  type        = set(string)
  default     = []

}

variable "sns_topic_arn" {
  description = "Topic ARN para notificaciones"
  type        = string
}

#######################################
#Propiedades default pod_status_failed
#######################################
variable "pod_status_failed_evaluation_periods" {
  description = "Número de períodos a evaluar para el estado de pods fallidos"
  type        = number
  default     = 1 # de periodo  /  1  * 300 segundos  =  300 segundos  =  5 minutos
}

variable "pod_status_failed_period" {
  description = "Periodo (en segundos) para la métrica de pods fallidos"
  type        = number
  default     = 300 # 5 minutos  
}

variable "pod_status_failed_threshold" {
  description = "Umbral de pods fallidos"
  type        = number
  default     = 0 #Detecta fallas reales en las aplicaciones inmediatamente  
}

##########################################
#Propiedades default node_status_not_ready
##########################################
variable "node_status_not_ready_evaluation_periods" {
  description = "Número de períodos a evaluar para el estado de nodos no listos"
  type        = number
  default     = 1 # de periodo  /  1  * 300 segundos  =  300 segundos  =  5 minutos
}

variable "node_status_not_ready_period" {
  description = "Periodo (en segundos) para la métrica de nodos no listos"
  type        = number
  default     = 300 # 5 minutos  
}

variable "node_status_not_ready_threshold" {
  description = "Umbral de nodos no listos"
  type        = number
  default     = 0 #Deteta Cualquier nodo no disponible impacta el clúster 
}

##########################################
#Propiedades default node_cpu_utilization
##########################################
variable "node_cpu_utilization_evaluation_periods" {
  description = "Número de períodos a evaluar para el uso de CPU de los nodos"
  type        = number
  default     = 2 # de periodos  /  2  * 300 segundos  =  600 segundos  =  10 minutos
}

variable "node_cpu_utilization_period" {
  description = "Periodo (en segundos) para la métrica de uso de CPU de los nodos"
  type        = number
  default     = 300 # 5 minutos  
}

variable "node_cpu_utilization_threshold" {
  description = "Umbral de uso de CPU de los nodos"
  type        = number
  default     = 80 # 80% de uso de CPU en los nodos
}

#############################################
#Propiedades default node_memory_utilization
#############################################
variable "node_memory_utilization_evaluation_periods" {
  description = "Número de períodos a evaluar para el uso de memoria de los nodos"
  type        = number
  default     = 2 # de periodos  /  2  * 300 segundos  =  600 segundos  =  10 minutos
}

variable "node_memory_utilization_period" {
  description = "Periodo (en segundos) para la métrica de uso de memoria de los nodos"
  type        = number
  default     = 300 # 5 minutos  
}

variable "node_memory_utilization_threshold" {
  description = "Umbral de uso de memoria de los nodos"
  type        = number
  default     = 80 # 85% de uso de memoria en los nodos
}

###############################
# Variables generales
###############################
variable "project" {
  type    = string
  default = "AWS_EKS"
}

variable "name_service" {
  type    = string
  default = "EKS"
}

variable "purpose" {
  type    = string
  default = "monitoring"
}

variable "environment" {
  type    = string
  default = "Dev"
}

