variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment_name" {
  description = "Nombre del entorno (ej. dev, prod)"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "alert_email" {
  description = "Correo electrónico que recibirá las alertas de SNS"
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
