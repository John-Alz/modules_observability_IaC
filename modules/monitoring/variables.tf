
variable "instance_id" {
  description = "El ID de la instancia EC2 a monitorear"
  type        = string
}

variable "alert_email" {
  description = "Correo electrónico que recibirá las alertas de SNS"
  type        = string
}

variable "environment_name" {
  description = "Nombre del entorno (ej. dev, prod, backend) para nombrar los recursos"
  type        = string
}

variable "cpu_threshold" {
  description = "Porcentaje de CPU que dispara la alarma"
  type        = number
  default     = 75
}

variable "evaluation_periods" {
  description = "Número de periodos consecutivos que deben superar el umbral"
  type        = number
  default     = 3
}

variable "period" {
  description = "El periodo en segundos sobre el cual se aplica la estadística"
  type        = number
  default     = 120
}