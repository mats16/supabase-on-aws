// Cloning Terraform src code to /var/folders/mz/ctw6xgmn6tl4gjxl6127075c0000gn/T/terraform_src...code has been checked out.

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}

locals {
  mappings = {
    TaskSize = {
      none = {
        cpu = 256
        memory = 512
      }
      micro = {
        cpu = 256
        memory = 512
      }
      small = {
        cpu = 512
        memory = 1024
      }
      medium = {
        cpu = 1024
        memory = 2048
      }
      large = {
        cpu = 2048
        memory = 4096
      }
      xlarge = {
        cpu = 4096
        memory = 8192
      }
      2xlarge = {
        cpu = 8192
        memory = 16384
      }
      4xlarge = {
        cpu = 16384
        memory = 32768
      }
    }
    ServiceprincipalMap = {
      af-south-1 = {
        states = "states.af-south-1.amazonaws.com"
      }
      ap-east-1 = {
        states = "states.ap-east-1.amazonaws.com"
      }
      ap-northeast-1 = {
        states = "states.ap-northeast-1.amazonaws.com"
      }
      ap-northeast-2 = {
        states = "states.ap-northeast-2.amazonaws.com"
      }
      ap-northeast-3 = {
        states = "states.ap-northeast-3.amazonaws.com"
      }
      ap-south-1 = {
        states = "states.ap-south-1.amazonaws.com"
      }
      ap-south-2 = {
        states = "states.ap-south-2.amazonaws.com"
      }
      ap-southeast-1 = {
        states = "states.ap-southeast-1.amazonaws.com"
      }
      ap-southeast-2 = {
        states = "states.ap-southeast-2.amazonaws.com"
      }
      ap-southeast-3 = {
        states = "states.ap-southeast-3.amazonaws.com"
      }
      ap-southeast-4 = {
        states = "states.ap-southeast-4.amazonaws.com"
      }
      ca-central-1 = {
        states = "states.ca-central-1.amazonaws.com"
      }
      cn-north-1 = {
        states = "states.cn-north-1.amazonaws.com"
      }
      cn-northwest-1 = {
        states = "states.cn-northwest-1.amazonaws.com"
      }
      eu-central-1 = {
        states = "states.eu-central-1.amazonaws.com"
      }
      eu-central-2 = {
        states = "states.eu-central-2.amazonaws.com"
      }
      eu-north-1 = {
        states = "states.eu-north-1.amazonaws.com"
      }
      eu-south-1 = {
        states = "states.eu-south-1.amazonaws.com"
      }
      eu-south-2 = {
        states = "states.eu-south-2.amazonaws.com"
      }
      eu-west-1 = {
        states = "states.eu-west-1.amazonaws.com"
      }
      eu-west-2 = {
        states = "states.eu-west-2.amazonaws.com"
      }
      eu-west-3 = {
        states = "states.eu-west-3.amazonaws.com"
      }
      il-central-1 = {
        states = "states.il-central-1.amazonaws.com"
      }
      me-central-1 = {
        states = "states.me-central-1.amazonaws.com"
      }
      me-south-1 = {
        states = "states.me-south-1.amazonaws.com"
      }
      sa-east-1 = {
        states = "states.sa-east-1.amazonaws.com"
      }
      us-east-1 = {
        states = "states.us-east-1.amazonaws.com"
      }
      us-east-2 = {
        states = "states.us-east-2.amazonaws.com"
      }
      us-gov-east-1 = {
        states = "states.us-gov-east-1.amazonaws.com"
      }
      us-gov-west-1 = {
        states = "states.us-gov-west-1.amazonaws.com"
      }
      us-iso-east-1 = {
        states = "states.amazonaws.com"
      }
      us-iso-west-1 = {
        states = "states.amazonaws.com"
      }
      us-isob-east-1 = {
        states = "states.amazonaws.com"
      }
      us-west-1 = {
        states = "states.us-west-1.amazonaws.com"
      }
      us-west-2 = {
        states = "states.us-west-2.amazonaws.com"
      }
    }
  }
  HighAvailability = var.enable_high_availability == "true"
  WorkMailEnabled = var.enable_work_mail == "true"
  CdnWafDisabledF333CA7D = var.web_acl_arn == ""
  KongServiceEnabled5CB62A18 = !var.kong_task_size93_c195_e9 == "none"
  KongAutoScalingEnabled41DC2F80 = alltrue([
  local.KongServiceEnabled5CB62A18,
  local.HighAvailability
])
  AuthServiceEnabled3234D87F = !var.auth_task_size9895_c206 == "none"
  AuthAutoScalingEnabled0CD7354E = alltrue([
  local.AuthServiceEnabled3234D87F,
  local.HighAvailability
])
  AuthProvider1Enabled983DA6B5 = !var.auth_provider1_name740_dd3_f6 == ""
  AuthProvider2Enabled05B8862B = !var.auth_provider2_name573986_e5 == ""
  AuthProvider3Enabled464D1673 = !var.auth_provider3_name_a8_a7785_f == ""
  RestServiceEnabledD6F99FCE = !var.rest_task_size14_e11_a14 == "none"
  RestAutoScalingEnabled69452861 = alltrue([
  local.RestServiceEnabledD6F99FCE,
  local.HighAvailability
])
  RealtimeServiceEnabled18ED891C = !var.realtime_task_size6077_fe1_f == "none"
  RealtimeAutoScalingEnabled7991ED3B = alltrue([
  local.RealtimeServiceEnabled18ED891C,
  local.HighAvailability
])
  ImgproxyServiceEnabled64E773FC = !var.imgproxy_task_size5_d0_dd9_f6 == "none"
  ImgproxyAutoScalingEnabled44E9E87F = alltrue([
  local.ImgproxyServiceEnabled64E773FC,
  local.HighAvailability
])
  StorageServiceEnabled58819374 = !var.storage_task_size_b82_d9_cfb == "none"
  StorageAutoScalingEnabled4D34646B = alltrue([
  local.StorageServiceEnabled58819374,
  local.HighAvailability
])
  MetaServiceEnabled094DCF06 = !var.meta_task_size556_d36_d9 == "none"
  MetaAutoScalingEnabledCF28EDB1 = alltrue([
  local.MetaServiceEnabled094DCF06,
  local.HighAvailability
])
  CDKMetadataAvailable = anytrue([anytrue([data.aws_region.current.name == "af-south-1", data.aws_region.current.name == "ap-east-1", data.aws_region.current.name == "ap-northeast-1", data.aws_region.current.name == "ap-northeast-2", data.aws_region.current.name == "ap-south-1", data.aws_region.current.name == "ap-southeast-1", data.aws_region.current.name == "ap-southeast-2", data.aws_region.current.name == "ca-central-1", data.aws_region.current.name == "cn-north-1", data.aws_region.current.name == "cn-northwest-1"]), anytrue([data.aws_region.current.name == "eu-central-1", data.aws_region.current.name == "eu-north-1", data.aws_region.current.name == "eu-south-1", data.aws_region.current.name == "eu-west-1", data.aws_region.current.name == "eu-west-2", data.aws_region.current.name == "eu-west-3", data.aws_region.current.name == "me-south-1", data.aws_region.current.name == "sa-east-1", data.aws_region.current.name == "us-east-1", data.aws_region.current.name == "us-east-2"]), anytrue([data.aws_region.current.name == "us-west-1", data.aws_region.current.name == "us-west-2"])])
  stack_name = "Supabase.template"
}

variable disable_signup {
  description = "When signup is disabled the only way to create new users is through invites. Defaults to false, all signups enabled."
  type = string
  default = "false"
}

variable site_url {
  description = "The base URL your site is located at. Currently used in combination with other settings to construct URLs used in emails."
  type = string
  default = "http://localhost:3000"
}

variable redirect_urls {
  description = "URLs that auth providers are permitted to redirect to post authentication"
  type = string
}

variable jwt_expiry_limit {
  description = "How long tokens are valid for. Defaults to 3600 (1 hour), maximum 604,800 seconds (one week)."
  type = string
  default = 3600
}

variable password_min_length {
  description = "When signup is disabled the only way to create new users is through invites. Defaults to false, all signups enabled."
  type = string
  default = "8"
}

variable email {
  description = "This is the email address the emails are sent from. If Amazon WorkMail is enabled, it set "noreply@supabase-<account_id>.awsapps.com""
  type = string
  default = "noreply@example.com"
}

variable sender_name {
  description = "The From email sender name for all emails sent."
  type = string
  default = "Supabase"
}

variable auth_image_uri {
  description = "https://gallery.ecr.aws/supabase/gotrue"
  type = string
  default = "public.ecr.aws/supabase/gotrue:v2.110.0"
}

variable rest_image_uri {
  description = "https://gallery.ecr.aws/supabase/postgrest"
  type = string
  default = "public.ecr.aws/supabase/postgrest:v11.2.0"
}

variable realtime_image_uri {
  description = "https://gallery.ecr.aws/supabase/realtime"
  type = string
  default = "public.ecr.aws/supabase/realtime:v2.25.27"
}

variable storage_image_uri {
  description = "https://gallery.ecr.aws/supabase/storage-api"
  type = string
  default = "public.ecr.aws/supabase/storage-api:v0.43.11"
}

variable imgproxy_image_uri {
  description = "https://gallery.ecr.aws/supabase/imgproxy"
  type = string
  default = "public.ecr.aws/supabase/imgproxy:v1.2.0"
}

variable postgres_meta_image_uri {
  description = "https://gallery.ecr.aws/supabase/postgres-meta"
  type = string
  default = "public.ecr.aws/supabase/postgres-meta:v0.74.2"
}

variable enable_high_availability {
  description = "Enable auto-scaling and clustering (Multi-AZ)."
  type = string
  default = "false"
}

variable web_acl_arn {
  description = "Web ACL for CloudFront."
  type = string
}

variable min_acu {
  description = "The minimum number of Aurora capacity units (ACU) for a DB instance in an Aurora Serverless v2 cluster."
  type = string
  default = 0.5
}

variable max_acu {
  description = "The maximum number of Aurora capacity units (ACU) for a DB instance in an Aurora Serverless v2 cluster."
  type = string
  default = 32
}

variable ses_region {
  description = "Amazon SES used for SMTP server. If you want to use Amazon WorkMail, need to set us-east-1, us-west-2 or eu-west-1."
  type = string
  default = "us-west-2"
}

variable enable_work_mail {
  description = "Enable test e-mail domain "xxx.awsapps.com" with Amazon WorkMail."
  type = string
  default = "false"
}

variable kong_task_size93_c195_e9 {
  description = "Fargare task size"
  type = string
  default = "medium"
}

variable auth_task_size9895_c206 {
  description = "Fargare task size"
  type = string
  default = "medium"
}

variable auth_provider1_name740_dd3_f6 {
  description = "External Auth Provider Name"
  type = string
}

variable auth_provider1_client_id5614_d178 {
  description = "The OAuth2 Client ID registered with the external provider."
  type = string
}

variable auth_provider1_secret_ae54364_f {
  description = "The OAuth2 Client Secret provided by the external provider when you registered."
  type = string
}

variable auth_provider2_name573986_e5 {
  description = "External Auth Provider Name"
  type = string
}

variable auth_provider2_client_id_f3685_a2_b {
  description = "The OAuth2 Client ID registered with the external provider."
  type = string
}

variable auth_provider2_secret2662_f55_e {
  description = "The OAuth2 Client Secret provided by the external provider when you registered."
  type = string
}

variable auth_provider3_name_a8_a7785_f {
  description = "External Auth Provider Name"
  type = string
}

variable auth_provider3_client_id8_df3_c6_f7 {
  description = "The OAuth2 Client ID registered with the external provider."
  type = string
}

variable auth_provider3_secret29364_f33 {
  description = "The OAuth2 Client Secret provided by the external provider when you registered."
  type = string
}

variable rest_task_size14_e11_a14 {
  description = "Fargare task size"
  type = string
  default = "medium"
}

variable realtime_task_size6077_fe1_f {
  description = "Fargare task size"
  type = string
  default = "medium"
}

variable imgproxy_task_size5_d0_dd9_f6 {
  description = "Fargare task size"
  type = string
  default = "medium"
}

variable storage_task_size_b82_d9_cfb {
  description = "Fargare task size"
  type = string
  default = "medium"
}

variable meta_task_size556_d36_d9 {
  description = "Fargare task size"
  type = string
  default = "medium"
}

variable studio_branch {
  description = "Branch or tag - https://github.com/supabase/supabase/tags"
  type = string
  default = "v0.23.09"
}

resource "aws_vpc" "vpcb9_e5_f0_b4" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"
  tags = {
    Name = "Supabase/VPC"
  }
}

// constant


variable vpc_id_cost {
  description = "VPC ID for cost calculation"
  type = string
  default= "vpc-fe53c884"
}

resource "aws_subnet" "vpc_public_subnet1_subnet_b4246_d30" {
  vpc_id = vpc_id_cost
  availability_zone = element (
  cidr_block = "10.0.0.0/18"
  map_public_ip_on_launch = true
  tags = {
    aws-cdk:subnet-name = "Public"
    aws-cdk:subnet-type = "Public"
    Name = "Supabase/VPC/PublicSubnet1"
  }
}

resource "aws_route_table" "vpc_public_subnet1_route_table_fee4_b781" {
  vpc_id = vpc_id_cost 
  tags = {
    Name = "Supabase/VPC/PublicSubnet1"
  }
}

resource "aws_route_table_association" "vpc_public_subnet1_route_table_association0_b0896_dc" {
  route_table_id = aws_route_table.vpc_public_subnet1_route_table_fee4_b781.id
  subnet_id = aws_subnet.vpc_public_subnet1_subnet_b4246_d30.id
}

resource "aws_route" "vpc_public_subnet1_default_route91_cef279" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpcigwb7_e252_d3.id
  route_table_id = aws_route_table.vpc_public_subnet1_route_table_fee4_b781.id
}

resource "aws_ec2_fleet" "vpc_public_subnet1_eip6_ad938_e8" {
  // CF Property(Domain) = "vpc"
  tags = {
    Name = "Supabase/VPC/PublicSubnet1"
  }
}

resource "aws_nat_gateway" "vpc_public_subnet1_nat_gateway_e0556630" {
  allocation_id = aws_ec2_fleet.vpc_public_subnet1_eip6_ad938_e8.id
  subnet_id = aws_subnet.vpc_public_subnet1_subnet_b4246_d30.id
  tags = {
    Name = "Supabase/VPC/PublicSubnet1"
  }
}

resource "aws_subnet" "vpc_public_subnet2_subnet74179_f39" {
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 1)
  cidr_block = "10.0.64.0/18"
  map_public_ip_on_launch = true
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
  tags = {
    aws-cdk:subnet-name = "Public"
    aws-cdk:subnet-type = "Public"
    Name = "Supabase/VPC/PublicSubnet2"
  }
}

resource "aws_route_table" "vpc_public_subnet2_route_table6_f1_a15_f1" {
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
  tags = {
    Name = "Supabase/VPC/PublicSubnet2"
  }
}

resource "aws_route_table_association" "vpc_public_subnet2_route_table_association5_a808732" {
  route_table_id = aws_route_table.vpc_public_subnet2_route_table6_f1_a15_f1.id
  subnet_id = aws_subnet.vpc_public_subnet2_subnet74179_f39.id
}

resource "aws_route" "vpc_public_subnet2_default_route_b7481_bba" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpcigwb7_e252_d3.id
  route_table_id = aws_route_table.vpc_public_subnet2_route_table6_f1_a15_f1.id
}

resource "aws_subnet" "vpc_private_subnet1_subnet8_bca10_e0" {
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 0)
  cidr_block = "10.0.128.0/18"
  map_public_ip_on_launch = false
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
  tags = {
    aws-cdk:subnet-name = "Private"
    aws-cdk:subnet-type = "Private"
    Name = "Supabase/VPC/PrivateSubnet1"
  }
}

resource "aws_route_table" "vpc_private_subnet1_route_table_be8_a6027" {
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
  tags = {
    Name = "Supabase/VPC/PrivateSubnet1"
  }
}

resource "aws_route_table_association" "vpc_private_subnet1_route_table_association347902_d1" {
  route_table_id = aws_route_table.vpc_private_subnet1_route_table_be8_a6027.id
  subnet_id = aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id
}

resource "aws_route" "vpc_private_subnet1_default_route_ae1_d6490" {
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.vpc_public_subnet1_nat_gateway_e0556630.association_id
  route_table_id = aws_route_table.vpc_private_subnet1_route_table_be8_a6027.id
}

resource "aws_subnet" "vpc_private_subnet2_subnet_cfcdaa7_a" {
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 1)
  cidr_block = "10.0.192.0/18"
  map_public_ip_on_launch = false
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
  tags = {
    aws-cdk:subnet-name = "Private"
    aws-cdk:subnet-type = "Private"
    Name = "Supabase/VPC/PrivateSubnet2"
  }
}

resource "aws_route_table" "vpc_private_subnet2_route_table0_a19_e10_e" {
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
  tags = {
    Name = "Supabase/VPC/PrivateSubnet2"
  }
}

resource "aws_route_table_association" "vpc_private_subnet2_route_table_association0_c73_d413" {
  route_table_id = aws_route_table.vpc_private_subnet2_route_table0_a19_e10_e.id
  subnet_id = aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
}

resource "aws_route" "vpc_private_subnet2_default_route_f4_f5_cfd2" {
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.vpc_public_subnet1_nat_gateway_e0556630.association_id
  route_table_id = aws_route_table.vpc_private_subnet2_route_table0_a19_e10_e.id
}

resource "aws_internet_gateway" "vpcigwb7_e252_d3" {
  tags = {
    Name = "Supabase/VPC"
  }
}

resource "aws_vpn_gateway_attachment" "vpcvpcgw99_b986_dc" {
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_ecs_cluster" "cluster_eb0386_a7" {
  setting = [
    {
      Name = "containerInsights"
      Value = "disabled"
    }
  ]
  service_connect_defaults {
    namespace = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.arn
  }
}

resource "aws_service_discovery_private_dns_namespace" "cluster_default_service_discovery_namespace_c336_f9_b4" {
  name = "supabase.internal"
  vpc = aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_ecs_cluster_capacity_providers" "cluster3_da9_ccba" {
  capacity_providers = [
    "FARGATE",
    "FARGATE_SPOT"
  ]
  cluster_name = aws_ecs_cluster.cluster_eb0386_a7.arn
  default_capacity_provider_strategy = [
  ]
}

resource "aws_rds_cluster_parameter_group" "database_parameter_group2_a921026" {
  description = "Parameter group for Supabase"
  family = "aurora-postgresql15"
  parameter = {
    rds.force_ssl = "0"
    shared_preload_libraries = "pg_tle, pg_stat_statements, pgaudit, pg_cron"
    rds.logical_replication = "1"
    max_slot_wal_keep_size = "1024"
  }
}

resource "aws_db_subnet_group" "database_cluster_subnets5540150_d" {
  description = "Subnets for Cluster database"
  subnet_ids = [
    aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
    aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
  ]
}

resource "aws_security_group" "database_cluster_security_group_fef1426_a" {
  description = "RDS security group"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_vpc_security_group_ingress_rule" "database_cluster_security_groupfrom_supabase_database_migration_function_security_group2273_cff4_indirect_port7_ebf4_aaa" {
  description = "from SupabaseDatabaseMigrationFunctionSecurityGroup2273CFF4:{IndirectPort}"
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
  referenced_security_group_id = aws_security_group.database_cluster_security_group_fef1426_a.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.database_migration_function_security_group279_b26_a2.id
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
}

resource "aws_vpc_security_group_ingress_rule" "database_cluster_security_groupfrom_supabase_database_user_password_function_security_group71503_a07_indirect_port8134897_c" {
  description = "from SupabaseDatabaseUserPasswordFunctionSecurityGroup71503A07:{IndirectPort}"
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
  referenced_security_group_id = aws_security_group.database_cluster_security_group_fef1426_a.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.database_user_password_function_security_group2_c5_b42_fb.id
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
}

resource "aws_vpc_security_group_ingress_rule" "database_cluster_security_groupfrom_supabase_auth_service_security_group_c0652_d23_indirect_port316_a82_a5" {
  description = "from SupabaseAuthServiceSecurityGroupC0652D23:{IndirectPort}"
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
  referenced_security_group_id = aws_security_group.database_cluster_security_group_fef1426_a.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.auth_service_security_group6440464_f.id
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
}

resource "aws_vpc_security_group_ingress_rule" "database_cluster_security_groupfrom_supabase_rest_service_security_group_c3243_df3_indirect_port2_d0_b0423" {
  description = "from SupabaseRestServiceSecurityGroupC3243DF3:{IndirectPort}"
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
  referenced_security_group_id = aws_security_group.database_cluster_security_group_fef1426_a.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.rest_service_security_group0_baea949.id
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
}

resource "aws_vpc_security_group_ingress_rule" "database_cluster_security_groupfrom_supabase_realtime_service_security_group570992_fe_indirect_port1_faa9_e4_f" {
  description = "from SupabaseRealtimeServiceSecurityGroup570992FE:{IndirectPort}"
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
  referenced_security_group_id = aws_security_group.database_cluster_security_group_fef1426_a.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.realtime_service_security_group8_e245_e7_e.id
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
}

resource "aws_vpc_security_group_ingress_rule" "database_cluster_security_groupfrom_supabase_storage_service_security_group_adf822_d4_indirect_port3_ce1_b682" {
  description = "from SupabaseStorageServiceSecurityGroupADF822D4:{IndirectPort}"
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
  referenced_security_group_id = aws_security_group.database_cluster_security_group_fef1426_a.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.storage_service_security_group_f6280_dc0.id
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
}

resource "aws_vpc_security_group_ingress_rule" "database_cluster_security_groupfrom_supabase_meta_service_security_group8_c22_dd35_indirect_port496372_c3" {
  description = "from SupabaseMetaServiceSecurityGroup8C22DD35:{IndirectPort}"
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
  referenced_security_group_id = aws_security_group.database_cluster_security_group_fef1426_a.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.meta_service_security_group0_e39_df35.id
  // Unable to resolve Fn::GetAtt with value: [
  //   "DatabaseCluster5B53A178",
  //   "Endpoint.Port"
  // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
}

resource "aws_secretsmanager_secret" "supabase_database_cluster_secret2_aa4_a5_cd3fdaad7efa858a3daf9490cf0a702aeb" {
  description = join("", ["Generated by the CDK for stack: ", local.stack_name])
  // CF Property(GenerateSecretString) = {
  //   ExcludeCharacters = " %+~`
  //   GenerateStringKey = "password"
  //   PasswordLength = 30
  //   SecretStringTemplate = "{"username":"supabase_admin"}"
  // }
  name = join("", [local.stack_name, "-Database-supabase_admin"])
}

resource "aws_secretsmanager_secret_rotation" "database_cluster_secret_attachment_dc8466_c0" {
  secret_id = aws_secretsmanager_secret.supabase_database_cluster_secret2_aa4_a5_cd3fdaad7efa858a3daf9490cf0a702aeb.id
  // CF Property(TargetId) = aws_rds_cluster.database_cluster5_b53_a178.arn
  // CF Property(TargetType) = "AWS::RDS::DBCluster"
}

resource "aws_rds_cluster" "database_cluster5_b53_a178" {
  copy_tags_to_snapshot = true
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.database_parameter_group2_a921026.id
  db_subnet_group_name = aws_db_subnet_group.database_cluster_subnets5540150_d.id
  database_name = "postgres"
  engine = "aurora-postgresql"
  engine_version = "15.4"
  manage_master_user_password = join("", ["{{resolve:secretsmanager:", aws_secretsmanager_secret.supabase_database_cluster_secret2_aa4_a5_cd3fdaad7efa858a3daf9490cf0a702aeb.id, ":SecretString:password::}}"])
  master_username = "supabase_admin"
  port = 5432
  serverlessv2_scaling_configuration = {
    MaxCapacity = var.max_acu
    MinCapacity = var.min_acu
  }
  storage_encrypted = true
  vpc_security_group_ids = [
    aws_security_group.database_cluster_security_group_fef1426_a.id
  ]
}

resource "aws_db_instance" "database_cluster_instance1_e154_d1_e9" {
  identifier = aws_rds_cluster.database_cluster5_b53_a178.arn
  instance_class = "db.serverless"
  engine = "aurora-postgresql"
  // CF Property(PromotionTier) = 0
}

resource "aws_db_instance" "database_cluster_instance2_d6_bcd1_ac" {
  count = local.HighAvailability ? 1 : 0
  identifier = aws_rds_cluster.database_cluster5_b53_a178.arn
  instance_class = "db.serverless"
  engine = "aurora-postgresql"
  // CF Property(PromotionTier) = 1
}

resource "aws_iam_role" "database_migration_function_service_role_e25_c2000" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]),
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"])
  ]
}

resource "aws_iam_policy" "database_migration_function_service_role_default_policy_baa52_d03" {
  policy = {
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id
      }
    ]
    Version = "2012-10-17"
  }
  name = "DatabaseMigrationFunctionServiceRoleDefaultPolicyBAA52D03"
  // CF Property(Roles) = [
  //   aws_iam_role.database_migration_function_service_role_e25_c2000.arn
  // ]
}

resource "aws_security_group" "database_migration_function_security_group279_b26_a2" {
  description = "Automatic security group for Lambda Function SupabaseDatabaseMigrationFunction60EA2449"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_lambda_function" "database_migration_function9_cbe9_ea5" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/60462bc764e8693b2d4b7dedf023e7763a7c011bc319950aed1b8ce75299f6a7.zip"
  }
  description = "Supabase - Database migration function"
  environment {
    variables = {
      DB_SECRET_ARN = aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id
      AWS_NODEJS_CONNECTION_REUSE_ENABLED = "1"
    }
  }
  handler = "index.handler"
  role = aws_iam_role.database_migration_function_service_role_e25_c2000.arn
  runtime = "nodejs20.x"
  timeout = 60
  vpc_config {
    security_group_ids = [
      aws_security_group.database_migration_function_security_group279_b26_a2.id
    ]
    subnet_ids = [
      aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
      aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
    ]
  }
}

resource "aws_iam_role" "database_migration_providerframeworkon_event_service_role5_cabfd28" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_iam_policy" "database_migration_providerframeworkon_event_service_role_default_policy_dfb3465_c" {
  policy = {
    Statement = [
      {
        Action = "lambda:InvokeFunction"
        Effect = "Allow"
        Resource = [
          aws_lambda_function.database_migration_function9_cbe9_ea5.arn,
          join("", [aws_lambda_function.database_migration_function9_cbe9_ea5.arn, ":*"])
        ]
      }
    ]
    Version = "2012-10-17"
  }
  name = "DatabaseMigrationProviderframeworkonEventServiceRoleDefaultPolicyDFB3465C"
  // CF Property(Roles) = [
  //   aws_iam_role.database_migration_providerframeworkon_event_service_role5_cabfd28.arn
  // ]
}

resource "aws_lambda_function" "database_migration_providerframeworkon_event48_d76_dda" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/7382a0addb9f34974a1ea6c6c9b063882af874828f366f5c93b2b7b64db15c94.zip"
  }
  description = "AWS CDK resource provider framework - onEvent (Supabase/Database/MigrationProvider)"
  environment {
    variables = {
      USER_ON_EVENT_FUNCTION_ARN = aws_lambda_function.database_migration_function9_cbe9_ea5.arn
    }
  }
  handler = "framework.onEvent"
  role = aws_iam_role.database_migration_providerframeworkon_event_service_role5_cabfd28.arn
  runtime = "nodejs18.x"
  timeout = 900
}

resource "aws_route_table_association" "database_migration993_f5_b9_c" {
  // CF Property(ServiceToken) = aws_lambda_function.database_migration_providerframeworkon_event48_d76_dda.arn
  // CF Property(Fingerprint) = "530e23e559653810f5c698b9e8972b00c67564a0c393f12b9963db3d82047a45"
}

resource "aws_iam_role" "database_user_password_function_service_role_d208_dcc1" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]),
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"])
  ]
}

resource "aws_iam_policy" "database_user_password_function_service_role_default_policy8_e1_c300_c" {
  policy = {
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:PutSecretValue"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:aws:secretsmanager:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":secret:", local.stack_name, "-Database-*"])
      },
      {
        NotAction = "secretsmanager:PutSecretValue"
        Effect = "Allow"
        Resource = aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id
      }
    ]
    Version = "2012-10-17"
  }
  name = "DatabaseUserPasswordFunctionServiceRoleDefaultPolicy8E1C300C"
  // CF Property(Roles) = [
  //   aws_iam_role.database_user_password_function_service_role_d208_dcc1.arn
  // ]
}

resource "aws_security_group" "database_user_password_function_security_group2_c5_b42_fb" {
  description = "Automatic security group for Lambda Function SupabaseDatabaseUserPasswordFunction2F544B74"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_lambda_function" "database_user_password_function_afac7436" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/9f9174dec158d89dd5bd125a21d30b9b3e198dc7291551f8793ce3d1fa23f29d.zip"
  }
  description = "Supabase - DB user password function"
  environment {
    variables = {
      DB_SECRET_ARN = aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id
      AWS_NODEJS_CONNECTION_REUSE_ENABLED = "1"
    }
  }
  handler = "index.handler"
  role = aws_iam_role.database_user_password_function_service_role_d208_dcc1.arn
  runtime = "nodejs20.x"
  timeout = 10
  vpc_config {
    security_group_ids = [
      aws_security_group.database_user_password_function_security_group2_c5_b42_fb.id
    ]
    subnet_ids = [
      aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
      aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
    ]
  }
}

resource "aws_iam_role" "database_user_password_providerframeworkon_event_service_role6_abbaa88" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_iam_policy" "database_user_password_providerframeworkon_event_service_role_default_policy_aa1280_b0" {
  policy = {
    Statement = [
      {
        Action = "lambda:InvokeFunction"
        Effect = "Allow"
        Resource = [
          aws_lambda_function.database_user_password_function_afac7436.arn,
          join("", [aws_lambda_function.database_user_password_function_afac7436.arn, ":*"])
        ]
      }
    ]
    Version = "2012-10-17"
  }
  name = "DatabaseUserPasswordProviderframeworkonEventServiceRoleDefaultPolicyAA1280B0"
  // CF Property(Roles) = [
  //   aws_iam_role.database_user_password_providerframeworkon_event_service_role6_abbaa88.arn
  // ]
}

resource "aws_lambda_function" "database_user_password_providerframeworkon_event_b02_aac24" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/7382a0addb9f34974a1ea6c6c9b063882af874828f366f5c93b2b7b64db15c94.zip"
  }
  description = "AWS CDK resource provider framework - onEvent (Supabase/Database/UserPasswordProvider)"
  environment {
    variables = {
      USER_ON_EVENT_FUNCTION_ARN = aws_lambda_function.database_user_password_function_afac7436.arn
    }
  }
  handler = "framework.onEvent"
  role = aws_iam_role.database_user_password_providerframeworkon_event_service_role6_abbaa88.arn
  runtime = "nodejs18.x"
  timeout = 900
}

resource "aws_secretsmanager_secret" "databasesupabaseauthadmin_secret_c3287578" {
  description = "Supabase - Database User supabase_auth_admin"
  // CF Property(GenerateSecretString) = {
  //   ExcludePunctuation = true
  //   GenerateStringKey = "password"
  //   SecretStringTemplate = "{"username":"supabase_auth_admin"}"
  // }
  name = join("", [local.stack_name, "-Database-supabase_auth_admin"])
}

resource "aws_customer_gateway" "databasesupabaseauthadmin_f9154_f88" {
  // CF Property(ServiceToken) = aws_lambda_function.database_user_password_providerframeworkon_event_b02_aac24.arn
  // CF Property(Username) = "supabase_auth_admin"
  // CF Property(SecretId) = aws_secretsmanager_secret.databasesupabaseauthadmin_secret_c3287578.id
}

resource "aws_secretsmanager_secret" "databasesupabasestorageadmin_secret88_c76_aa3" {
  description = "Supabase - Database User supabase_storage_admin"
  // CF Property(GenerateSecretString) = {
  //   ExcludePunctuation = true
  //   GenerateStringKey = "password"
  //   SecretStringTemplate = "{"username":"supabase_storage_admin"}"
  // }
  name = join("", [local.stack_name, "-Database-supabase_storage_admin"])
}

resource "aws_customer_gateway" "databasesupabasestorageadmin_a3_d9_aa2_c" {
  // CF Property(ServiceToken) = aws_lambda_function.database_user_password_providerframeworkon_event_b02_aac24.arn
  // CF Property(Username) = "supabase_storage_admin"
  // CF Property(SecretId) = aws_secretsmanager_secret.databasesupabasestorageadmin_secret88_c76_aa3.id
}

resource "aws_secretsmanager_secret" "databaseauthenticator_secret69_fa14_de" {
  description = "Supabase - Database User authenticator"
  // CF Property(GenerateSecretString) = {
  //   ExcludePunctuation = true
  //   GenerateStringKey = "password"
  //   SecretStringTemplate = "{"username":"authenticator"}"
  // }
  name = join("", [local.stack_name, "-Database-authenticator"])
}

resource "aws_customer_gateway" "databaseauthenticator35_b4_e8_e9" {
  // CF Property(ServiceToken) = aws_lambda_function.database_user_password_providerframeworkon_event_b02_aac24.arn
  // CF Property(Username) = "authenticator"
  // CF Property(SecretId) = aws_secretsmanager_secret.databaseauthenticator_secret69_fa14_de.id
}

resource "aws_secretsmanager_secret" "databasedashboarduser_secret102_d2_f3_b" {
  description = "Supabase - Database User dashboard_user"
  // CF Property(GenerateSecretString) = {
  //   ExcludePunctuation = true
  //   GenerateStringKey = "password"
  //   SecretStringTemplate = "{"username":"dashboard_user"}"
  // }
  name = join("", [local.stack_name, "-Database-dashboard_user"])
}

resource "aws_customer_gateway" "databasedashboarduser_bef03_eec" {
  // CF Property(ServiceToken) = aws_lambda_function.database_user_password_providerframeworkon_event_b02_aac24.arn
  // CF Property(Username) = "dashboard_user"
  // CF Property(SecretId) = aws_secretsmanager_secret.databasedashboarduser_secret102_d2_f3_b.id
}

resource "aws_secretsmanager_secret" "databasepostgres_secret8_e64_af98" {
  description = "Supabase - Database User postgres"
  // CF Property(GenerateSecretString) = {
  //   ExcludePunctuation = true
  //   GenerateStringKey = "password"
  //   SecretStringTemplate = "{"username":"postgres"}"
  // }
  name = join("", [local.stack_name, "-Database-postgres"])
}

resource "aws_customer_gateway" "databasepostgres_dce7_da96" {
  // CF Property(ServiceToken) = aws_lambda_function.database_user_password_providerframeworkon_event_b02_aac24.arn
  // CF Property(Username) = "postgres"
  // CF Property(SecretId) = aws_secretsmanager_secret.databasepostgres_secret8_e64_af98.id
}

resource "aws_iam_policy" "smtp_send_email_policy_cca0_aa9_b" {
  policy = {
    Statement = [
      {
        Action = "ses:SendRawEmail"
        Effect = "Allow"
        Resource = "*"
      }
    ]
    Version = "2012-10-17"
  }
  name = "SmtpSendEmailPolicyCCA0AA9B"
  // CF Property(Users) = [
  //   aws_iam_user.smtp_user4973_df55.arn
  // ]
}

resource "aws_iam_user" "smtp_user4973_df55" {}

resource "aws_iam_access_key" "smtp_access_key_ccad8_b7_d" {
  user = aws_iam_user.smtp_user4973_df55.arn
}

resource "aws_iam_role" "smtp_password_function_service_role_a0_a9_c3_a3" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_lambda_function" "smtp_password_function_dc49_b7_cc" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/cbb9c0c24fa0ee781b61f07de9aab9f7fbd9d5fec8eed79f7c53870781adaf38.zip"
  }
  description = "Supabase - Generate SMTP Password Function"
  environment {
    variables = {
      AWS_NODEJS_CONNECTION_REUSE_ENABLED = "1"
    }
  }
  handler = "index.handler"
  role = aws_iam_role.smtp_password_function_service_role_a0_a9_c3_a3.arn
  runtime = "nodejs20.x"
}

resource "aws_iam_role" "smtp_password_providerframeworkon_event_service_role_f0717454" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_iam_policy" "smtp_password_providerframeworkon_event_service_role_default_policy_d17_bd380" {
  policy = {
    Statement = [
      {
        Action = "lambda:InvokeFunction"
        Effect = "Allow"
        Resource = [
          aws_lambda_function.smtp_password_function_dc49_b7_cc.arn,
          join("", [aws_lambda_function.smtp_password_function_dc49_b7_cc.arn, ":*"])
        ]
      }
    ]
    Version = "2012-10-17"
  }
  name = "SmtpPasswordProviderframeworkonEventServiceRoleDefaultPolicyD17BD380"
  // CF Property(Roles) = [
  //   aws_iam_role.smtp_password_providerframeworkon_event_service_role_f0717454.arn
  // ]
}

resource "aws_lambda_function" "smtp_password_providerframeworkon_event430_eb845" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/7382a0addb9f34974a1ea6c6c9b063882af874828f366f5c93b2b7b64db15c94.zip"
  }
  description = "AWS CDK resource provider framework - onEvent (Supabase/Smtp/PasswordProvider)"
  environment {
    variables = {
      USER_ON_EVENT_FUNCTION_ARN = aws_lambda_function.smtp_password_function_dc49_b7_cc.arn
    }
  }
  handler = "framework.onEvent"
  role = aws_iam_role.smtp_password_providerframeworkon_event_service_role_f0717454.arn
  runtime = "nodejs18.x"
  timeout = 900
}

resource "aws_customer_gateway" "smtp_password_ba01_e518" {
  // CF Property(ServiceToken) = aws_lambda_function.smtp_password_providerframeworkon_event430_eb845.arn
  // CF Property(Region) = var.ses_region
  // CF Property(SecretAccessKey) = aws_iam_access_key.smtp_access_key_ccad8_b7_d.secret
}

resource "aws_cloudformation_stack" "smtp_work_mail_nested_stack_work_mail_nested_stack_resource042_ecb25" {
  count = local.WorkMailEnabled ? 1 : 0
  parameters = {
    referencetoSupabaseSesRegion184A3193Ref = var.ses_region
    referencetoSupabaseSmtpPassword76B56B34Password = aws_customer_gateway.smtp_password_ba01_e518.id
  }
  template_url = join("", ["https://s3.", data.aws_region.current.name, ".", data.aws_partition.current.dns_suffix, "/", "supabase-on-aws-${data.aws_region.current.name}", "/stable/03f62f4c6a40df766b2afaa523da311dff846927099d46e60851b49562d81e9f"])
}

resource "aws_secretsmanager_secret" "smtp_secret_f89_cc16_b" {
  description = "Supabase - SMTP Secret"
  name = join("", [local.stack_name, "SmtpSecret"])
  force_overwrite_replica_secret = join("", ["{"username":"", local.WorkMailEnabled ? aws_cloudformation_stack.smtp_work_mail_nested_stack_work_mail_nested_stack_resource042_ecb25.outputs.SupabaseSmtpWorkMailOrganizationSupabaseBD859A4AEmail : aws_iam_access_key.smtp_access_key_ccad8_b7_d.create_date, "","password":"", aws_customer_gateway.smtp_password_ba01_e518.id, "","host":"", local.WorkMailEnabled ? join("", ["smtp.mail.", var.ses_region, ".awsapps.com"]) : join("", ["email-smtp.", var.ses_region, ".amazonaws.com"]), ""}"])
}

resource "aws_secretsmanager_secret" "jwt_secret_b8834_b39" {
  description = join("", [local.stack_name, " - Json Web Token Secret"])
  // CF Property(GenerateSecretString) = {
  //   ExcludePunctuation = true
  //   PasswordLength = 64
  // }
}

resource "aws_iam_role" "jwt_secret_json_web_token_function_service_role17_cf8128" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_iam_policy" "jwt_secret_json_web_token_function_service_role_default_policy_fec3_e7_ba" {
  policy = {
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
      }
    ]
    Version = "2012-10-17"
  }
  name = "JwtSecretJsonWebTokenFunctionServiceRoleDefaultPolicyFEC3E7BA"
  // CF Property(Roles) = [
  //   aws_iam_role.jwt_secret_json_web_token_function_service_role17_cf8128.arn
  // ]
}

resource "aws_lambda_function" "jwt_secret_json_web_token_function_f8_ba9_d2_a" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/baf945a52f8e02b1131009f27d8b23a50b9eacc020ff363093145c8e6f5dbc01.zip"
  }
  description = join("", [local.stack_name, " - Generate token via jwt secret"])
  environment {
    variables = {
      JWT_SECRET_ARN = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
      AWS_NODEJS_CONNECTION_REUSE_ENABLED = "1"
    }
  }
  handler = "index.handler"
  role = aws_iam_role.jwt_secret_json_web_token_function_service_role17_cf8128.arn
  runtime = "nodejs20.x"
}

resource "aws_iam_role" "jwt_secret_generate_token_providerframeworkon_event_service_role_d6_b5_b68_a" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_iam_policy" "jwt_secret_generate_token_providerframeworkon_event_service_role_default_policy14_f466_a4" {
  policy = {
    Statement = [
      {
        Action = "lambda:InvokeFunction"
        Effect = "Allow"
        Resource = [
          aws_lambda_function.jwt_secret_json_web_token_function_f8_ba9_d2_a.arn,
          join("", [aws_lambda_function.jwt_secret_json_web_token_function_f8_ba9_d2_a.arn, ":*"])
        ]
      }
    ]
    Version = "2012-10-17"
  }
  name = "JwtSecretGenerateTokenProviderframeworkonEventServiceRoleDefaultPolicy14F466A4"
  // CF Property(Roles) = [
  //   aws_iam_role.jwt_secret_generate_token_providerframeworkon_event_service_role_d6_b5_b68_a.arn
  // ]
}

resource "aws_lambda_function" "jwt_secret_generate_token_providerframeworkon_event34_dd1_aaa" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/7382a0addb9f34974a1ea6c6c9b063882af874828f366f5c93b2b7b64db15c94.zip"
  }
  description = "AWS CDK resource provider framework - onEvent (Supabase/JwtSecret/GenerateTokenProvider)"
  environment {
    variables = {
      USER_ON_EVENT_FUNCTION_ARN = aws_lambda_function.jwt_secret_json_web_token_function_f8_ba9_d2_a.arn
    }
  }
  handler = "framework.onEvent"
  role = aws_iam_role.jwt_secret_generate_token_providerframeworkon_event_service_role_d6_b5_b68_a.arn
  runtime = "nodejs18.x"
  timeout = 900
}

resource "aws_kms_custom_key_store" "jwt_secret_anon_key63_f37_a1_e" {
  // CF Property(ServiceToken) = aws_lambda_function.jwt_secret_generate_token_providerframeworkon_event34_dd1_aaa.arn
  // CF Property(Payload) = {
  //   role = "anon"
  // }
  // CF Property(Issuer) = "supabase"
  // CF Property(ExpiresIn) = "10y"
}

resource "aws_ssm_parameter" "jwt_secret_anon_key_parameter532_dcc06" {
  description = join("", [local.stack_name, " - Json Web Token, role: anon"])
  name = join("", ["/", local.stack_name, "/JwtSecret/AnonKey"])
  type = "String"
  value = aws_kms_custom_key_store.jwt_secret_anon_key63_f37_a1_e.cloud_hsm_cluster_id
}

resource "aws_kms_custom_key_store" "jwt_secret_service_role_key_f0_f6_c193" {
  // CF Property(ServiceToken) = aws_lambda_function.jwt_secret_generate_token_providerframeworkon_event34_dd1_aaa.arn
  // CF Property(Payload) = {
  //   role = "service_role"
  // }
  // CF Property(Issuer) = "supabase"
  // CF Property(ExpiresIn) = "10y"
}

resource "aws_ssm_parameter" "jwt_secret_service_role_key_parameter_b65536_eb" {
  description = join("", [local.stack_name, " - Json Web Token, role: service_role"])
  name = join("", ["/", local.stack_name, "/JwtSecret/ServiceRoleKey"])
  type = "String"
  value = aws_kms_custom_key_store.jwt_secret_service_role_key_f0_f6_c193.cloud_hsm_cluster_id
}

resource "aws_elasticsearch_domain_policy" "load_balancer_be9_eec3_a" {
  // CF Property(LoadBalancerAttributes) = [
  //   {
  //     Key = "deletion_protection.enabled"
  //     Value = "false"
  //   }
  // ]
  // CF Property(Scheme) = "internet-facing"
  // CF Property(SecurityGroups) = [
  //   aws_security_group.load_balancer_security_group_a28_d6_dd7.id
  // ]
  // CF Property(Subnets) = [
  //   aws_subnet.vpc_public_subnet1_subnet_b4246_d30.id,
  //   aws_subnet.vpc_public_subnet2_subnet74179_f39.id
  // ]
  // CF Property(Type) = "application"
}

resource "aws_security_group" "load_balancer_security_group_a28_d6_dd7" {
  description = "Automatically created Security Group for ELB SupabaseLoadBalancer630C0AFC"
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_vpc_security_group_ingress_rule" "load_balancer_security_groupfrom_indirect_peer80_ab4_c6575" {
  description = "CloudFront"
  from_port = 80
  referenced_security_group_id = aws_security_group.load_balancer_security_group_a28_d6_dd7.id
  ip_protocol = "tcp"
  // Unable to resolve Fn::GetAtt with value: [
  //   "CloudFrontPrefixList22014EFD",
  //   "PrefixLists.0.PrefixListId"
  // ] because Error parsing nested stack output for PrefixLists.0.PrefixListId
  to_port = 80
}

resource "aws_vpc_security_group_egress_rule" "load_balancer_security_groupto_supabase_kong_service_security_group_b3_c4_ac8_f800011_c84_c57" {
  description = "Load balancer to target"
  security_group_id = aws_security_group.kong_service_security_group_e199_ee6_c.id
  from_port = 8000
  referenced_security_group_id = aws_security_group.load_balancer_security_group_a28_d6_dd7.id
  ip_protocol = "tcp"
  to_port = 8000
}

resource "aws_vpc_security_group_egress_rule" "load_balancer_security_groupto_supabase_kong_service_security_group_b3_c4_ac8_f8100711401_b1" {
  description = "ALB healthcheck"
  security_group_id = aws_security_group.kong_service_security_group_e199_ee6_c.id
  from_port = 8100
  referenced_security_group_id = aws_security_group.load_balancer_security_group_a28_d6_dd7.id
  ip_protocol = "tcp"
  to_port = 8100
}

resource "aws_load_balancer_listener_policy" "load_balancer_listener_e1_a099_b9" {
  // CF Property(DefaultActions) = [
  //   {
  //     TargetGroupArn = aws_elasticache_parameter_group.kong_target_group_d0277_b2_a.id
  //     Type = "forward"
  //   }
  // ]
  load_balancer_name = aws_elasticsearch_domain_policy.load_balancer_be9_eec3_a.domain_name
  load_balancer_port = 80
  // CF Property(Protocol) = "HTTP"
}

resource "aws_ec2_managed_prefix_list" "cloud_front_prefix_list22014_efd" {
  // CF Property(ServiceToken) = aws_lambda_function.aws679f53fac002430cb0da5b7982bd22872_d164_c4_c.arn
  // CF Property(Create) = "{"service":"EC2","action":"describeManagedPrefixLists","parameters":{"Filters":[{"Name":"prefix-list-name","Values":["com.amazonaws.global.cloudfront.origin-facing"]}]},"physicalResourceId":{"responsePath":"PrefixLists.0.PrefixListId"}}"
  // CF Property(InstallLatestAwsSdk) = true
}

resource "aws_iam_policy" "cloud_front_prefix_list_custom_resource_policy_b6_babde5" {
  policy = {
    Statement = [
      {
        Action = "ec2:DescribeManagedPrefixLists"
        Effect = "Allow"
        Resource = "*"
      }
    ]
    Version = "2012-10-17"
  }
  name = "CloudFrontPrefixListCustomResourcePolicyB6BABDE5"
  // CF Property(Roles) = [
  //   aws_iam_role.aws679f53fac002430cb0da5b7982bd2287_service_role_c1_ea0_ff2.arn
  // ]
}

resource "aws_iam_role" "aws679f53fac002430cb0da5b7982bd2287_service_role_c1_ea0_ff2" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_lambda_function" "aws679f53fac002430cb0da5b7982bd22872_d164_c4_c" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/17c16a3854838fd3ff4bda08146122a6701f33b9c86ae17f415ad0dc47a97544.zip"
  }
  handler = "index.handler"
  role = aws_iam_role.aws679f53fac002430cb0da5b7982bd2287_service_role_c1_ea0_ff2.arn
  runtime = "nodejs18.x"
  timeout = 120
}

resource "aws_cloudfront_cache_policy" "cdn_cache_policy957_d7474" {
  parameters_in_cache_key_and_forwarded_to_origin {
    // CF Property(Comment) = "Policy for Supabase API"
    // CF Property(DefaultTTL) = 1
    // CF Property(MaxTTL) = 600
    // CF Property(MinTTL) = 0
    // CF Property(Name) = join("", [local.stack_name, "-CachePolicy-", data.aws_region.current.name])
    // CF Property(ParametersInCacheKeyAndForwardedToOrigin) = {
    //   CookiesConfig = {
    //     CookieBehavior = "none"
    //   }
    //   EnableAcceptEncodingBrotli = true
    //   EnableAcceptEncodingGzip = true
    //   HeadersConfig = {
    //     HeaderBehavior = "whitelist"
    //     Headers = [
    //       "apikey",
    //       "authorization",
    //       "host"
    //     ]
    //   }
    //   QueryStringsConfig = {
    //     QueryStringBehavior = "all"
    //   }
    // }
  }
}

resource "aws_cloudfront_response_headers_policy" "cdn_response_headers_policy36_e4_b823" {
  cors_config {
    // CF Property(Comment) = "Policy for Supabase API"
    // CF Property(CustomHeadersConfig) = {
    //   Items = [
    //     {
    //       Header = "server"
    //       Override = true
    //       Value = "cloudfront"
    //     }
    //   ]
    // }
    // CF Property(Name) = join("", [local.stack_name, "-ResponseHeadersPolicy-", data.aws_region.current.name])
  }
}

resource "aws_cloudfront_distribution" "cdn_distribution149_fa6_c8" {
  // CF Property(DistributionConfig) = {
  //   CacheBehaviors = [
  //     {
  //       AllowedMethods = [
  //         "GET",
  //         "HEAD"
  //       ]
  //       CachePolicyId = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  //       Compress = true
  //       OriginRequestPolicyId = "216adef6-5c7f-47e4-b989-5492eafa07d3"
  //       PathPattern = "storage/v1/object/public/*"
  //       ResponseHeadersPolicyId = aws_cloudfront_response_headers_policy.cdn_response_headers_policy36_e4_b823.etag
  //       TargetOriginId = "SupabaseCdnDistributionOrigin1C1F18041"
  //       ViewerProtocolPolicy = "redirect-to-https"
  //     }
  //   ]
  //   Comment = "Supabase - CDN (Supabase/Cdn/Distribution)"
  //   CustomErrorResponses = [
  //     {
  //       ErrorCachingMinTTL = 10
  //       ErrorCode = 500
  //     },
  //     {
  //       ErrorCachingMinTTL = 10
  //       ErrorCode = 501
  //     },
  //     {
  //       ErrorCachingMinTTL = 10
  //       ErrorCode = 502
  //     },
  //     {
  //       ErrorCachingMinTTL = 10
  //       ErrorCode = 503
  //     },
  //     {
  //       ErrorCachingMinTTL = 10
  //       ErrorCode = 504
  //     }
  //   ]
  //   DefaultCacheBehavior = {
  //     AllowedMethods = [
  //       "GET",
  //       "HEAD",
  //       "OPTIONS",
  //       "PUT",
  //       "PATCH",
  //       "POST",
  //       "DELETE"
  //     ]
  //     CachePolicyId = aws_cloudfront_cache_policy.cdn_cache_policy957_d7474.etag
  //     Compress = true
  //     OriginRequestPolicyId = "216adef6-5c7f-47e4-b989-5492eafa07d3"
  //     ResponseHeadersPolicyId = aws_cloudfront_response_headers_policy.cdn_response_headers_policy36_e4_b823.etag
  //     TargetOriginId = "SupabaseCdnDistributionOrigin1C1F18041"
  //     ViewerProtocolPolicy = "redirect-to-https"
  //   }
  //   Enabled = true
  //   HttpVersion = "http2and3"
  //   IPV6Enabled = true
  //   Origins = [
  //     {
  //       CustomOriginConfig = {
  //         OriginProtocolPolicy = "http-only"
  //         OriginSSLProtocols = [
  //           "TLSv1.2"
  //         ]
  //       }
  //       DomainName = aws_elasticsearch_domain_policy.load_balancer_be9_eec3_a.domain_name
  //       Id = "SupabaseCdnDistributionOrigin1C1F18041"
  //     }
  //   ]
  //   WebACLId = local.CdnWafDisabledF333CA7D ? null : var.web_acl_arn
  // }
}

resource "aws_secretsmanager_secret" "cdn_cache_manager_api_key137_d2795" {
  description = "Supabase - API key for CDN cache manager"
  // CF Property(GenerateSecretString) = {
  //   ExcludePunctuation = true
  // }
  name = join("", [local.stack_name, "-CDN-CacheManager-ApiKey"])
}

resource "aws_sqs_queue" "cdn_cache_manager_queue786_d7_fa2" {}

resource "aws_iam_role" "cdn_cache_manager_api_function_service_role_a4_d8_f8_db" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_iam_policy" "cdn_cache_manager_api_function_service_role_default_policy74947_a18" {
  policy = {
    Statement = [
      {
        Action = [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords"
        ]
        Effect = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "sqs:SendMessage",
          "sqs:GetQueueAttributes",
          "sqs:GetQueueUrl"
        ]
        Effect = "Allow"
        Resource = aws_sqs_queue.cdn_cache_manager_queue786_d7_fa2.arn
      }
    ]
    Version = "2012-10-17"
  }
  name = "CdnCacheManagerApiFunctionServiceRoleDefaultPolicy74947A18"
  // CF Property(Roles) = [
  //   aws_iam_role.cdn_cache_manager_api_function_service_role_a4_d8_f8_db.arn
  // ]
}

resource "aws_lambda_function" "cdn_cache_manager_api_function8_f3_cc846" {
  architectures = [
    "arm64"
  ]
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/8a91672f58486c885aa9527e06ea94ef8dcbadc65b50e3e6eff95ea5f50fb0ae.zip"
  }
  description = "Supabase/Cdn/CacheManager/ApiFunction"
  environment {
    variables = {
      QUEUE_URL = aws_sqs_queue.cdn_cache_manager_queue786_d7_fa2.id
      API_KEY = join("", ["{{resolve:secretsmanager:", aws_secretsmanager_secret.cdn_cache_manager_api_key137_d2795.id, ":SecretString:::}}"])
      AWS_NODEJS_CONNECTION_REUSE_ENABLED = "1"
    }
  }
  handler = "index.handler"
  layers = [
    join("", ["arn:aws:lambda:", data.aws_region.current.name, ":094274105915:layer:AWSLambdaPowertoolsTypeScript:25"])
  ]
  role = aws_iam_role.cdn_cache_manager_api_function_service_role_a4_d8_f8_db.arn
  runtime = "nodejs20.x"
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_alias" "cdn_cache_manager_api_function_function_url37928_fc6" {
  // CF Property(AuthType) = "NONE"
  // CF Property(TargetFunctionArn) = aws_lambda_function.cdn_cache_manager_api_function8_f3_cc846.arn
}

resource "aws_lambda_permission" "cdn_cache_manager_api_functioninvokefunctionurl25_d0_ab1_e" {
  action = "lambda:InvokeFunctionUrl"
  function_name = aws_lambda_function.cdn_cache_manager_api_function8_f3_cc846.arn
  function_url_auth_type = "NONE"
  principal = "*"
}

resource "aws_iam_role" "cdn_cache_manager_queue_consumer_service_role273_baafa" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_iam_policy" "cdn_cache_manager_queue_consumer_service_role_default_policy2_de8002_e" {
  policy = {
    Statement = [
      {
        Action = "cloudfront:CreateInvalidation"
        Effect = "Allow"
        Resource = join("", ["arn:aws:cloudfront::", data.aws_caller_identity.current.account_id, ":distribution/", aws_cloudfront_distribution.cdn_distribution149_fa6_c8.id])
      },
      {
        Action = [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords"
        ]
        Effect = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "sqs:ReceiveMessage",
          "sqs:ChangeMessageVisibility",
          "sqs:GetQueueUrl",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Effect = "Allow"
        Resource = aws_sqs_queue.cdn_cache_manager_queue786_d7_fa2.arn
      }
    ]
    Version = "2012-10-17"
  }
  name = "CdnCacheManagerQueueConsumerServiceRoleDefaultPolicy2DE8002E"
  // CF Property(Roles) = [
  //   aws_iam_role.cdn_cache_manager_queue_consumer_service_role273_baafa.arn
  // ]
}

resource "aws_lambda_function" "cdn_cache_manager_queue_consumer_a50_b36_c1" {
  architectures = [
    "arm64"
  ]
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/703e21783239f1557ffe7219fab4fb09901f0ebdefca6570ebb946dd10f3085b.zip"
  }
  description = "Supabase/Cdn/CacheManager/QueueConsumer"
  environment {
    variables = {
      DISTRIBUTION_ID = aws_cloudfront_distribution.cdn_distribution149_fa6_c8.id
      AWS_NODEJS_CONNECTION_REUSE_ENABLED = "1"
    }
  }
  handler = "index.handler"
  layers = [
    join("", ["arn:aws:lambda:", data.aws_region.current.name, ":094274105915:layer:AWSLambdaPowertoolsTypeScript:25"])
  ]
  role = aws_iam_role.cdn_cache_manager_queue_consumer_service_role273_baafa.arn
  runtime = "nodejs20.x"
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_event_source_mapping" "cdn_cache_manager_queue_consumer_sqs_event_source_supabase_cdn_cache_manager_queue31_d5861_e48_e96905" {
  batch_size = 100
  event_source_arn = aws_sqs_queue.cdn_cache_manager_queue786_d7_fa2.arn
  function_name = aws_lambda_function.cdn_cache_manager_queue_consumer_a50_b36_c1.arn
  maximum_batching_window_in_seconds = 5
}

resource "aws_iam_role" "kong_task_def_task_role62_a71_ddf" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_ecs_task_definition" "kong_task_def115_e456_d" {
  container_definitions = [
    {
      Environment = [
        {
          Name = "KONG_DNS_ORDER"
          Value = "LAST,A,CNAME"
        },
        {
          Name = "KONG_PLUGINS"
          Value = "request-transformer,cors,key-auth,acl,basic-auth,opentelemetry"
        },
        {
          Name = "KONG_NGINX_PROXY_PROXY_BUFFER_SIZE"
          Value = "160k"
        },
        {
          Name = "KONG_NGINX_PROXY_PROXY_BUFFERS"
          Value = "64 160k"
        },
        {
          Name = "KONG_STATUS_LISTEN"
          Value = "0.0.0.0:8100"
        },
        {
          Name = "SUPABASE_AUTH_URL"
          Value = "http://auth.supabase.internal:9999/"
        },
        {
          Name = "SUPABASE_REST_URL"
          Value = "http://rest.supabase.internal:3000/"
        },
        {
          Name = "SUPABASE_REALTIME_URL"
          Value = "http://realtime-dev.supabase.internal:4000/socket/"
        },
        {
          Name = "SUPABASE_STORAGE_URL"
          Value = "http://storage.supabase.internal:5000/"
        },
        {
          Name = "SUPABASE_META_HOST"
          Value = "http://meta.supabase.internal:8080/"
        }
      ]
      Essential = true
      HealthCheck = {
        Command = [
          "CMD",
          "kong",
          "health"
        ]
        Interval = 5
        Retries = 3
        Timeout = 5
      }
      Image = "public.ecr.aws/u3p7q2r8/kong:latest"
      LogConfiguration = {
        LogDriver = "awslogs"
        Options = {
          awslogs-group = aws_cloudwatch_log_group.kong_logs4_bd50491.arn
          awslogs-stream-prefix = "ecs"
          awslogs-region = data.aws_region.current.name
        }
      }
      Name = "app"
      PortMappings = [
        {
          ContainerPort = 8000
          Name = "http"
          Protocol = "tcp"
        }
      ]
      Secrets = [
        {
          Name = "SUPABASE_ANON_KEY"
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_anon_key_parameter532_dcc06.arn])
        },
        {
          Name = "SUPABASE_SERVICE_KEY"
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_service_role_key_parameter_b65536_eb.arn])
        }
      ]
      Ulimits = [
        {
          HardLimit = 65536
          Name = "nofile"
          SoftLimit = 65536
        }
      ]
    }
  ]
  cpu = local.mappings["TaskSize"][var.kong_task_size93_c195_e9]["cpu"]
  execution_role_arn = aws_iam_role.kong_task_def_execution_role349_e43_dd.arn
  family = "SupabaseKongTaskDef151136E7"
  memory = local.mappings["TaskSize"][var.kong_task_size93_c195_e9]["memory"]
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"
  ]
  runtime_platform {
    cpu_architecture = "ARM64"
    operating_system_family = "LINUX"
  }
  task_role_arn = aws_iam_role.kong_task_def_task_role62_a71_ddf.arn
}

resource "aws_iam_role" "kong_task_def_execution_role349_e43_dd" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "kong_task_def_execution_role_default_policy99546_d68" {
  policy = {
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect = "Allow"
        Resource = aws_cloudwatch_log_group.kong_logs4_bd50491.arn
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_anon_key_parameter532_dcc06.arn])
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_service_role_key_parameter_b65536_eb.arn])
      }
    ]
    Version = "2012-10-17"
  }
  name = "KongTaskDefExecutionRoleDefaultPolicy99546D68"
  // CF Property(Roles) = [
  //   aws_iam_role.kong_task_def_execution_role349_e43_dd.arn
  // ]
}

resource "aws_cloudwatch_log_group" "kong_logs4_bd50491" {
  retention_in_days = 30
}

resource "aws_ecs_service" "kong_service33127_c91" {
  cluster = aws_ecs_cluster.cluster_eb0386_a7.arn
  // CF Property(DeploymentConfiguration) = {
  //   Alarms = {
  //     AlarmNames = [
  //     ]
  //     Enable = false
  //     Rollback = false
  //   }
  //   DeploymentCircuitBreaker = {
  //     Enable = true
  //     Rollback = true
  //   }
  //   MaximumPercent = 200
  //   MinimumHealthyPercent = 50
  // }
  deployment_controller {
    type = "ECS"
  }
  desired_count = local.KongServiceEnabled5CB62A18 ? null : 0
  enable_ecs_managed_tags = true
  health_check_grace_period_seconds = 60
  launch_type = "FARGATE"
  load_balancer = [
    {
      container_name = "app"
      container_port = 8000
      target_group_arn = aws_elasticache_parameter_group.kong_target_group_d0277_b2_a.id
    }
  ]
  network_configuration {
    // CF Property(AwsvpcConfiguration) = {
    //   AssignPublicIp = "DISABLED"
    //   SecurityGroups = [
    //     aws_security_group.kong_service_security_group_e199_ee6_c.id
    //   ]
    //   Subnets = [
    //     aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
    //     aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
    //   ]
    // }
  }
  propagate_tags = "SERVICE"
  service_registries = [
    {
      container_name = "app"
      container_port = 8000
      registry_arn = aws_service_discovery_service.kong_service_cloudmap_service59_ecfe3_a.arn
    }
  ]
  task_definition = aws_ecs_task_definition.kong_task_def115_e456_d.arn
}

resource "aws_security_group" "kong_service_security_group_e199_ee6_c" {
  description = "Supabase/Kong/Service/SecurityGroup"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_vpc_security_group_ingress_rule" "kong_service_security_groupfrom_supabase_load_balancer_security_group_addf6_eb880000_f4_ca2_e4" {
  description = "Load balancer to target"
  from_port = 8000
  referenced_security_group_id = aws_security_group.kong_service_security_group_e199_ee6_c.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.load_balancer_security_group_a28_d6_dd7.id
  to_port = 8000
}

resource "aws_vpc_security_group_ingress_rule" "kong_service_security_groupfrom_supabase_load_balancer_security_group_addf6_eb881008_d65_c13_d" {
  description = "ALB healthcheck"
  from_port = 8100
  referenced_security_group_id = aws_security_group.kong_service_security_group_e199_ee6_c.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.load_balancer_security_group_a28_d6_dd7.id
  to_port = 8100
}

resource "aws_service_discovery_service" "kong_service_cloudmap_service59_ecfe3_a" {
  dns_config = {
    DnsRecords = [
      {
        TTL = 10
        Type = "SRV"
      },
      {
        Type = "A"
        TTL = 10
      }
    ]
    NamespaceId = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
    RoutingPolicy = "MULTIVALUE"
  }
  health_check_custom_config {
    failure_threshold = 1
  }
  name = "kong"
  namespace_id = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
}

resource "aws_appautoscaling_target" "kong_service_task_count_target5_cd21_eeb" {
  count = local.KongAutoScalingEnabled41DC2F80 ? 1 : 0
  max_capacity = 20
  min_capacity = 2
  resource_id = join("", ["service/", aws_ecs_cluster.cluster_eb0386_a7.arn, "/", aws_ecs_service.kong_service33127_c91.name])
  role_arn = join("", ["arn:", data.aws_partition.current.partition, ":iam::", data.aws_caller_identity.current.account_id, ":role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"])
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"
}

resource "aws_appautoscaling_policy" "kong_service_task_count_target_scale_on_cpu_e9_fbe5_e2" {
  count = local.KongAutoScalingEnabled41DC2F80 ? 1 : 0
  name = "SupabaseKongServiceTaskCountTargetScaleOnCpu7C47F3C3"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.kong_service_task_count_target5_cd21_eeb[0].arn
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification = {
      PredefinedMetricType = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown = 60
    scale_out_cooldown = 60
    target_value = 50
  }
}

resource "aws_elasticache_parameter_group" "kong_target_group_d0277_b2_a" {
  // CF Property(HealthCheckIntervalSeconds) = 5
  // CF Property(HealthCheckPath) = "/status"
  // CF Property(HealthCheckPort) = "8100"
  // CF Property(HealthCheckTimeoutSeconds) = 2
  // CF Property(Port) = 8000
  // CF Property(Protocol) = "HTTP"
  // CF Property(TargetGroupAttributes) = [
  //   {
  //     Key = "deregistration_delay.timeout_seconds"
  //     Value = "30"
  //   },
  //   {
  //     Key = "stickiness.enabled"
  //     Value = "false"
  //   }
  // ]
  // CF Property(TargetType) = "ip"
  // CF Property(VpcId) = aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_iam_role" "auth_task_def_task_role8_ce224_af" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_ecs_task_definition" "auth_task_def5_fb652_ed" {
  container_definitions = [
    {
      Environment = [
        {
          Name = "GOTRUE_API_HOST"
          Value = "0.0.0.0"
        },
        {
          Name = "GOTRUE_API_PORT"
          Value = "9999"
        },
        {
          Name = "API_EXTERNAL_URL"
          Value = join("", ["https://", aws_cloudfront_distribution.cdn_distribution149_fa6_c8.domain_name])
        },
        {
          Name = "GOTRUE_DB_DRIVER"
          Value = "postgres"
        },
        {
          Name = "GOTRUE_SITE_URL"
          Value = var.site_url
        },
        {
          Name = "GOTRUE_URI_ALLOW_LIST"
          Value = var.redirect_urls
        },
        {
          Name = "GOTRUE_DISABLE_SIGNUP"
          Value = var.disable_signup
        },
        {
          Name = "GOTRUE_JWT_ADMIN_ROLES"
          Value = "service_role"
        },
        {
          Name = "GOTRUE_JWT_AUD"
          Value = "authenticated"
        },
        {
          Name = "GOTRUE_JWT_DEFAULT_GROUP_NAME"
          Value = "authenticated"
        },
        {
          Name = "GOTRUE_JWT_EXP"
          Value = var.jwt_expiry_limit
        },
        {
          Name = "GOTRUE_EXTERNAL_EMAIL_ENABLED"
          Value = "true"
        },
        {
          Name = "GOTRUE_MAILER_AUTOCONFIRM"
          Value = "false"
        },
        {
          Name = "GOTRUE_SMTP_ADMIN_EMAIL"
          Value = local.WorkMailEnabled ? aws_cloudformation_stack.smtp_work_mail_nested_stack_work_mail_nested_stack_resource042_ecb25.outputs.SupabaseSmtpWorkMailOrganizationSupabaseBD859A4AEmail : var.email
        },
        {
          Name = "GOTRUE_SMTP_HOST"
          Value = local.WorkMailEnabled ? join("", ["smtp.mail.", var.ses_region, ".awsapps.com"]) : join("", ["email-smtp.", var.ses_region, ".amazonaws.com"])
        },
        {
          Name = "GOTRUE_SMTP_PORT"
          Value = "465"
        },
        {
          Name = "GOTRUE_SMTP_SENDER_NAME"
          Value = var.sender_name
        },
        {
          Name = "GOTRUE_MAILER_URLPATHS_INVITE"
          Value = "/auth/v1/verify"
        },
        {
          Name = "GOTRUE_MAILER_URLPATHS_CONFIRMATION"
          Value = "/auth/v1/verify"
        },
        {
          Name = "GOTRUE_MAILER_URLPATHS_RECOVERY"
          Value = "/auth/v1/verify"
        },
        {
          Name = "GOTRUE_MAILER_URLPATHS_EMAIL_CHANGE"
          Value = "/auth/v1/verify"
        },
        {
          Name = "GOTRUE_EXTERNAL_PHONE_ENABLED"
          Value = "false"
        },
        {
          Name = "GOTRUE_SMS_AUTOCONFIRM"
          Value = "true"
        },
        {
          Name = "GOTRUE_RATE_LIMIT_EMAIL_SENT"
          Value = "3600"
        },
        {
          Name = "GOTRUE_PASSWORD_MIN_LENGTH"
          Value = var.password_min_length
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider1Enabled983DA6B5 ? var.auth_provider1_name740_dd3_f6 : "PROVIDER1", "_ENABLED"])
          Value = local.AuthProvider1Enabled983DA6B5 ? "true" : "false"
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider1Enabled983DA6B5 ? var.auth_provider1_name740_dd3_f6 : "PROVIDER1", "_REDIRECT_URI"])
          Value = join("", ["https://", aws_cloudfront_distribution.cdn_distribution149_fa6_c8.domain_name, "/auth/v1/callback"])
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider2Enabled05B8862B ? var.auth_provider2_name573986_e5 : "PROVIDER2", "_ENABLED"])
          Value = local.AuthProvider2Enabled05B8862B ? "true" : "false"
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider2Enabled05B8862B ? var.auth_provider2_name573986_e5 : "PROVIDER2", "_REDIRECT_URI"])
          Value = join("", ["https://", aws_cloudfront_distribution.cdn_distribution149_fa6_c8.domain_name, "/auth/v1/callback"])
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider3Enabled464D1673 ? var.auth_provider3_name_a8_a7785_f : "PROVIDER3", "_ENABLED"])
          Value = local.AuthProvider3Enabled464D1673 ? "true" : "false"
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider3Enabled464D1673 ? var.auth_provider3_name_a8_a7785_f : "PROVIDER3", "_REDIRECT_URI"])
          Value = join("", ["https://", aws_cloudfront_distribution.cdn_distribution149_fa6_c8.domain_name, "/auth/v1/callback"])
        }
      ]
      Essential = true
      HealthCheck = {
        Command = [
          "CMD",
          "wget",
          "--no-verbose",
          "--tries=1",
          "--spider",
          "http://localhost:9999/health"
        ]
        Interval = 5
        Retries = 3
        Timeout = 5
      }
      Image = var.auth_image_uri
      LogConfiguration = {
        LogDriver = "awslogs"
        Options = {
          awslogs-group = aws_cloudwatch_log_group.auth_logs940_c0551.arn
          awslogs-stream-prefix = "ecs"
          awslogs-region = data.aws_region.current.name
        }
      }
      Name = "app"
      PortMappings = [
        {
          ContainerPort = 9999
          Name = "http"
          Protocol = "tcp"
        }
      ]
      Secrets = [
        {
          Name = "GOTRUE_DB_DATABASE_URL"
          ValueFrom = join("", [aws_secretsmanager_secret.databasesupabaseauthadmin_secret_c3287578.id, ":uri::"])
        },
        {
          Name = "GOTRUE_JWT_SECRET"
          ValueFrom = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
        },
        {
          Name = "GOTRUE_SMTP_USER"
          ValueFrom = join("", [aws_secretsmanager_secret.smtp_secret_f89_cc16_b.id, ":username::"])
        },
        {
          Name = "GOTRUE_SMTP_PASS"
          ValueFrom = join("", [aws_secretsmanager_secret.smtp_secret_f89_cc16_b.id, ":password::"])
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider1Enabled983DA6B5 ? var.auth_provider1_name740_dd3_f6 : "PROVIDER1", "_CLIENT_ID"])
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider1_client_id_parameter_a8_cdd11_d.arn])
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider1Enabled983DA6B5 ? var.auth_provider1_name740_dd3_f6 : "PROVIDER1", "_SECRET"])
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider1_secret_parameter32101_b7_a.arn])
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider2Enabled05B8862B ? var.auth_provider2_name573986_e5 : "PROVIDER2", "_CLIENT_ID"])
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider2_client_id_parameter30_d2_a6_d6.arn])
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider2Enabled05B8862B ? var.auth_provider2_name573986_e5 : "PROVIDER2", "_SECRET"])
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider2_secret_parameter4_b28_a4_be.arn])
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider3Enabled464D1673 ? var.auth_provider3_name_a8_a7785_f : "PROVIDER3", "_CLIENT_ID"])
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider3_client_id_parameter6_da38073.arn])
        },
        {
          Name = join("", ["GOTRUE_EXTERNAL_", local.AuthProvider3Enabled464D1673 ? var.auth_provider3_name_a8_a7785_f : "PROVIDER3", "_SECRET"])
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider3_secret_parameter7_a77_f7_f4.arn])
        }
      ]
      Ulimits = [
        {
          HardLimit = 65536
          Name = "nofile"
          SoftLimit = 65536
        }
      ]
    }
  ]
  cpu = local.mappings["TaskSize"][var.auth_task_size9895_c206]["cpu"]
  execution_role_arn = aws_iam_role.auth_task_def_execution_role071231_b5.arn
  family = "SupabaseAuthTaskDef66536EFB"
  memory = local.mappings["TaskSize"][var.auth_task_size9895_c206]["memory"]
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"
  ]
  runtime_platform {
    cpu_architecture = "ARM64"
    operating_system_family = "LINUX"
  }
  task_role_arn = aws_iam_role.auth_task_def_task_role8_ce224_af.arn
}

resource "aws_iam_role" "auth_task_def_execution_role071231_b5" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "auth_task_def_execution_role_default_policy_b7_aff08_d" {
  policy = {
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect = "Allow"
        Resource = aws_cloudwatch_log_group.auth_logs940_c0551.arn
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.databasesupabaseauthadmin_secret_c3287578.id
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.smtp_secret_f89_cc16_b.id
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider1_client_id_parameter_a8_cdd11_d.arn])
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider1_secret_parameter32101_b7_a.arn])
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider2_client_id_parameter30_d2_a6_d6.arn])
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider2_secret_parameter4_b28_a4_be.arn])
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider3_client_id_parameter6_da38073.arn])
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.auth_provider3_secret_parameter7_a77_f7_f4.arn])
      }
    ]
    Version = "2012-10-17"
  }
  name = "AuthTaskDefExecutionRoleDefaultPolicyB7AFF08D"
  // CF Property(Roles) = [
  //   aws_iam_role.auth_task_def_execution_role071231_b5.arn
  // ]
}

resource "aws_cloudwatch_log_group" "auth_logs940_c0551" {
  retention_in_days = 30
}

resource "aws_ecs_service" "auth_service_ba690728" {
  cluster = aws_ecs_cluster.cluster_eb0386_a7.arn
  // CF Property(DeploymentConfiguration) = {
  //   Alarms = {
  //     AlarmNames = [
  //     ]
  //     Enable = false
  //     Rollback = false
  //   }
  //   DeploymentCircuitBreaker = {
  //     Enable = true
  //     Rollback = true
  //   }
  //   MaximumPercent = 200
  //   MinimumHealthyPercent = 50
  // }
  deployment_controller {
    type = "ECS"
  }
  desired_count = local.AuthServiceEnabled3234D87F ? null : 0
  enable_ecs_managed_tags = true
  launch_type = "FARGATE"
  network_configuration {
    // CF Property(AwsvpcConfiguration) = {
    //   AssignPublicIp = "DISABLED"
    //   SecurityGroups = [
    //     aws_security_group.auth_service_security_group6440464_f.id
    //   ]
    //   Subnets = [
    //     aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
    //     aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
    //   ]
    // }
  }
  propagate_tags = "SERVICE"
  service_registries = [
    {
      container_name = "app"
      container_port = 9999
      registry_arn = aws_service_discovery_service.auth_service_cloudmap_service57_d92_a65.arn
    }
  ]
  task_definition = aws_ecs_task_definition.auth_task_def5_fb652_ed.arn
}

resource "aws_security_group" "auth_service_security_group6440464_f" {
  description = "Supabase/Auth/Service/SecurityGroup"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_vpc_security_group_ingress_rule" "auth_service_security_groupfrom_supabase_kong_service_security_group_b3_c4_ac8_f99999367_c437" {
  description = "from SupabaseKongServiceSecurityGroupB3C4AC8F:9999"
  from_port = 9999
  referenced_security_group_id = aws_security_group.auth_service_security_group6440464_f.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.kong_service_security_group_e199_ee6_c.id
  to_port = 9999
}

resource "aws_service_discovery_service" "auth_service_cloudmap_service57_d92_a65" {
  dns_config = {
    DnsRecords = [
      {
        TTL = 10
        Type = "SRV"
      },
      {
        Type = "A"
        TTL = 10
      }
    ]
    NamespaceId = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
    RoutingPolicy = "MULTIVALUE"
  }
  health_check_custom_config {
    failure_threshold = 1
  }
  name = "auth"
  namespace_id = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
}

resource "aws_appautoscaling_target" "auth_service_task_count_target07_a8_ccd2" {
  count = local.AuthAutoScalingEnabled0CD7354E ? 1 : 0
  max_capacity = 20
  min_capacity = 2
  resource_id = join("", ["service/", aws_ecs_cluster.cluster_eb0386_a7.arn, "/", aws_ecs_service.auth_service_ba690728.name])
  role_arn = join("", ["arn:", data.aws_partition.current.partition, ":iam::", data.aws_caller_identity.current.account_id, ":role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"])
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"
}

resource "aws_appautoscaling_policy" "auth_service_task_count_target_scale_on_cpu0847_acec" {
  count = local.AuthAutoScalingEnabled0CD7354E ? 1 : 0
  name = "SupabaseAuthServiceTaskCountTargetScaleOnCpu253117F9"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.auth_service_task_count_target07_a8_ccd2[0].arn
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification = {
      PredefinedMetricType = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown = 60
    scale_out_cooldown = 60
    target_value = 50
  }
}

resource "aws_ssm_parameter" "auth_provider1_client_id_parameter_a8_cdd11_d" {
  description = "The OAuth2 Client ID registered with the external provider."
  name = join("", ["/", local.stack_name, "/Auth/External/", local.AuthProvider1Enabled983DA6B5 ? var.auth_provider1_name740_dd3_f6 : "Provider1", "/ClientId"])
  type = "String"
  value = local.AuthProvider1Enabled983DA6B5 ? var.auth_provider1_client_id5614_d178 : "null"
}

resource "aws_ssm_parameter" "auth_provider1_secret_parameter32101_b7_a" {
  description = "The OAuth2 Client Secret provided by the external provider when you registered."
  name = join("", ["/", local.stack_name, "/Auth/External/", local.AuthProvider1Enabled983DA6B5 ? var.auth_provider1_name740_dd3_f6 : "Provider1", "/Secret"])
  type = "String"
  value = local.AuthProvider1Enabled983DA6B5 ? var.auth_provider1_secret_ae54364_f : "null"
}

resource "aws_ssm_parameter" "auth_provider2_client_id_parameter30_d2_a6_d6" {
  description = "The OAuth2 Client ID registered with the external provider."
  name = join("", ["/", local.stack_name, "/Auth/External/", local.AuthProvider2Enabled05B8862B ? var.auth_provider2_name573986_e5 : "Provider2", "/ClientId"])
  type = "String"
  value = local.AuthProvider2Enabled05B8862B ? var.auth_provider2_client_id_f3685_a2_b : "null"
}

resource "aws_ssm_parameter" "auth_provider2_secret_parameter4_b28_a4_be" {
  description = "The OAuth2 Client Secret provided by the external provider when you registered."
  name = join("", ["/", local.stack_name, "/Auth/External/", local.AuthProvider2Enabled05B8862B ? var.auth_provider2_name573986_e5 : "Provider2", "/Secret"])
  type = "String"
  value = local.AuthProvider2Enabled05B8862B ? var.auth_provider2_secret2662_f55_e : "null"
}

resource "aws_ssm_parameter" "auth_provider3_client_id_parameter6_da38073" {
  description = "The OAuth2 Client ID registered with the external provider."
  name = join("", ["/", local.stack_name, "/Auth/External/", local.AuthProvider3Enabled464D1673 ? var.auth_provider3_name_a8_a7785_f : "Provider3", "/ClientId"])
  type = "String"
  value = local.AuthProvider3Enabled464D1673 ? var.auth_provider3_client_id8_df3_c6_f7 : "null"
}

resource "aws_ssm_parameter" "auth_provider3_secret_parameter7_a77_f7_f4" {
  description = "The OAuth2 Client Secret provided by the external provider when you registered."
  name = join("", ["/", local.stack_name, "/Auth/External/", local.AuthProvider3Enabled464D1673 ? var.auth_provider3_name_a8_a7785_f : "Provider3", "/Secret"])
  type = "String"
  value = local.AuthProvider3Enabled464D1673 ? var.auth_provider3_secret29364_f33 : "null"
}

resource "aws_iam_role" "rest_task_def_task_role59_e8_d431" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_ecs_task_definition" "rest_task_def716_bd951" {
  container_definitions = [
    {
      Environment = [
        {
          Name = "PGRST_DB_SCHEMAS"
          Value = "public,storage,graphql_public"
        },
        {
          Name = "PGRST_DB_ANON_ROLE"
          Value = "anon"
        },
        {
          Name = "PGRST_DB_USE_LEGACY_GUCS"
          Value = "false"
        },
        {
          Name = "PGRST_APP_SETTINGS_JWT_EXP"
          Value = var.jwt_expiry_limit
        }
      ]
      Essential = true
      Image = var.rest_image_uri
      LogConfiguration = {
        LogDriver = "awslogs"
        Options = {
          awslogs-group = aws_cloudwatch_log_group.rest_logs_e8_b49088.arn
          awslogs-stream-prefix = "ecs"
          awslogs-region = data.aws_region.current.name
        }
      }
      Name = "app"
      PortMappings = [
        {
          ContainerPort = 3000
          Name = "http"
          Protocol = "tcp"
        }
      ]
      Secrets = [
        {
          Name = "PGRST_DB_URI"
          ValueFrom = join("", [aws_secretsmanager_secret.databaseauthenticator_secret69_fa14_de.id, ":uri::"])
        },
        {
          Name = "PGRST_JWT_SECRET"
          ValueFrom = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
        },
        {
          Name = "PGRST_APP_SETTINGS_JWT_SECRET"
          ValueFrom = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
        }
      ]
      Ulimits = [
        {
          HardLimit = 65536
          Name = "nofile"
          SoftLimit = 65536
        }
      ]
    }
  ]
  cpu = local.mappings["TaskSize"][var.rest_task_size14_e11_a14]["cpu"]
  execution_role_arn = aws_iam_role.rest_task_def_execution_role8_e4_c9_f62.arn
  family = "SupabaseRestTaskDef0C1A5ADE"
  memory = local.mappings["TaskSize"][var.rest_task_size14_e11_a14]["memory"]
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"
  ]
  runtime_platform {
    cpu_architecture = "ARM64"
    operating_system_family = "LINUX"
  }
  task_role_arn = aws_iam_role.rest_task_def_task_role59_e8_d431.arn
}

resource "aws_iam_role" "rest_task_def_execution_role8_e4_c9_f62" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "rest_task_def_execution_role_default_policy2_e2_b5505" {
  policy = {
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect = "Allow"
        Resource = aws_cloudwatch_log_group.rest_logs_e8_b49088.arn
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.databaseauthenticator_secret69_fa14_de.id
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
      }
    ]
    Version = "2012-10-17"
  }
  name = "RestTaskDefExecutionRoleDefaultPolicy2E2B5505"
  // CF Property(Roles) = [
  //   aws_iam_role.rest_task_def_execution_role8_e4_c9_f62.arn
  // ]
}

resource "aws_cloudwatch_log_group" "rest_logs_e8_b49088" {
  retention_in_days = 30
}

resource "aws_ecs_service" "rest_service8812_c0_b2" {
  cluster = aws_ecs_cluster.cluster_eb0386_a7.arn
  // CF Property(DeploymentConfiguration) = {
  //   Alarms = {
  //     AlarmNames = [
  //     ]
  //     Enable = false
  //     Rollback = false
  //   }
  //   DeploymentCircuitBreaker = {
  //     Enable = true
  //     Rollback = true
  //   }
  //   MaximumPercent = 200
  //   MinimumHealthyPercent = 50
  // }
  deployment_controller {
    type = "ECS"
  }
  desired_count = local.RestServiceEnabledD6F99FCE ? null : 0
  enable_ecs_managed_tags = true
  launch_type = "FARGATE"
  network_configuration {
    // CF Property(AwsvpcConfiguration) = {
    //   AssignPublicIp = "DISABLED"
    //   SecurityGroups = [
    //     aws_security_group.rest_service_security_group0_baea949.id
    //   ]
    //   Subnets = [
    //     aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
    //     aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
    //   ]
    // }
  }
  propagate_tags = "SERVICE"
  service_registries = [
    {
      container_name = "app"
      container_port = 3000
      registry_arn = aws_service_discovery_service.rest_service_cloudmap_service_a978698_c.arn
    }
  ]
  task_definition = aws_ecs_task_definition.rest_task_def716_bd951.arn
}

resource "aws_security_group" "rest_service_security_group0_baea949" {
  description = "Supabase/Rest/Service/SecurityGroup"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_vpc_security_group_ingress_rule" "rest_service_security_groupfrom_supabase_kong_service_security_group_b3_c4_ac8_f300032126_e75" {
  description = "from SupabaseKongServiceSecurityGroupB3C4AC8F:3000"
  from_port = 3000
  referenced_security_group_id = aws_security_group.rest_service_security_group0_baea949.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.kong_service_security_group_e199_ee6_c.id
  to_port = 3000
}

resource "aws_vpc_security_group_ingress_rule" "rest_service_security_groupfrom_supabase_auth_service_security_group_c0652_d2330004_e9_de7_f5" {
  description = "from SupabaseAuthServiceSecurityGroupC0652D23:3000"
  from_port = 3000
  referenced_security_group_id = aws_security_group.rest_service_security_group0_baea949.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.auth_service_security_group6440464_f.id
  to_port = 3000
}

resource "aws_vpc_security_group_ingress_rule" "rest_service_security_groupfrom_supabase_storage_service_security_group_adf822_d430009563_cf9_c" {
  description = "from SupabaseStorageServiceSecurityGroupADF822D4:3000"
  from_port = 3000
  referenced_security_group_id = aws_security_group.rest_service_security_group0_baea949.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.storage_service_security_group_f6280_dc0.id
  to_port = 3000
}

resource "aws_service_discovery_service" "rest_service_cloudmap_service_a978698_c" {
  dns_config = {
    DnsRecords = [
      {
        TTL = 10
        Type = "SRV"
      },
      {
        Type = "A"
        TTL = 10
      }
    ]
    NamespaceId = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
    RoutingPolicy = "MULTIVALUE"
  }
  health_check_custom_config {
    failure_threshold = 1
  }
  name = "rest"
  namespace_id = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
}

resource "aws_appautoscaling_target" "rest_service_task_count_target8_c6_e8_e1_e" {
  count = local.RestAutoScalingEnabled69452861 ? 1 : 0
  max_capacity = 20
  min_capacity = 2
  resource_id = join("", ["service/", aws_ecs_cluster.cluster_eb0386_a7.arn, "/", aws_ecs_service.rest_service8812_c0_b2.name])
  role_arn = join("", ["arn:", data.aws_partition.current.partition, ":iam::", data.aws_caller_identity.current.account_id, ":role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"])
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"
}

resource "aws_appautoscaling_policy" "rest_service_task_count_target_scale_on_cpu_e9845870" {
  count = local.RestAutoScalingEnabled69452861 ? 1 : 0
  name = "SupabaseRestServiceTaskCountTargetScaleOnCpuB529B263"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.rest_service_task_count_target8_c6_e8_e1_e[0].arn
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification = {
      PredefinedMetricType = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown = 60
    scale_out_cooldown = 60
    target_value = 50
  }
}

resource "aws_secretsmanager_secret" "cookie_signing_secret_e5797145" {
  description = "Supabase - Cookie Signing Secret for Realtime"
  // CF Property(GenerateSecretString) = {
  //   ExcludePunctuation = true
  //   PasswordLength = 64
  // }
  name = join("", [local.stack_name, "-Realtime-CookieSigning-Secret"])
}

resource "aws_iam_role" "realtime_task_def_task_role3682_e469" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_ecs_task_definition" "realtime_task_def9_e0_dd838" {
  container_definitions = [
    {
      Command = [
        "sh",
        "-c",
        "/app/bin/migrate && /app/bin/realtime eval "Realtime.Release.seeds(Realtime.Repo)" && /app/bin/server"
      ]
      EntryPoint = [
        "/usr/bin/tini",
        "-s",
        "-g",
        "--"
      ]
      Environment = [
        {
          Name = "PORT"
          Value = "4000"
        },
        {
          Name = "DB_HOST"
          Value =           // Unable to resolve Fn::GetAtt with value: [
          //   "DatabaseCluster5B53A178",
          //   "Endpoint.Address"
          // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
        },
        {
          Name = "DB_PORT"
          Value =           // Unable to resolve Fn::GetAtt with value: [
          //   "DatabaseCluster5B53A178",
          //   "Endpoint.Port"
          // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
        },
        {
          Name = "DB_AFTER_CONNECT_QUERY"
          Value = "SET search_path TO realtime"
        },
        {
          Name = "DB_ENC_KEY"
          Value = "supabaserealtime"
        },
        {
          Name = "FLY_ALLOC_ID"
          Value = "fly123"
        },
        {
          Name = "FLY_APP_NAME"
          Value = "realtime"
        },
        {
          Name = "ERL_AFLAGS"
          Value = "-proto_dist inet_tcp"
        },
        {
          Name = "ENABLE_TAILSCALE"
          Value = "false"
        },
        {
          Name = "DNS_NODES"
          Value = "realtime-dev.supabase.internal"
        }
      ]
      Essential = true
      Image = var.realtime_image_uri
      LogConfiguration = {
        LogDriver = "awslogs"
        Options = {
          awslogs-group = aws_cloudwatch_log_group.realtime_logs5_c43159_d.arn
          awslogs-stream-prefix = "ecs"
          awslogs-region = data.aws_region.current.name
        }
      }
      Name = "app"
      PortMappings = [
        {
          ContainerPort = 4000
          Name = "http"
          Protocol = "tcp"
        }
      ]
      Secrets = [
        {
          Name = "DB_USER"
          ValueFrom = join("", [aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id, ":username::"])
        },
        {
          Name = "DB_PASSWORD"
          ValueFrom = join("", [aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id, ":password::"])
        },
        {
          Name = "DB_NAME"
          ValueFrom = join("", [aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id, ":dbname::"])
        },
        {
          Name = "API_JWT_SECRET"
          ValueFrom = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
        },
        {
          Name = "SECRET_KEY_BASE"
          ValueFrom = aws_secretsmanager_secret.cookie_signing_secret_e5797145.id
        }
      ]
      Ulimits = [
        {
          HardLimit = 65536
          Name = "nofile"
          SoftLimit = 65536
        }
      ]
    }
  ]
  cpu = local.mappings["TaskSize"][var.realtime_task_size6077_fe1_f]["cpu"]
  execution_role_arn = aws_iam_role.realtime_task_def_execution_role578_aa7_f5.arn
  family = "SupabaseRealtimeTaskDef0EF41020"
  memory = local.mappings["TaskSize"][var.realtime_task_size6077_fe1_f]["memory"]
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"
  ]
  runtime_platform {
    cpu_architecture = "ARM64"
    operating_system_family = "LINUX"
  }
  task_role_arn = aws_iam_role.realtime_task_def_task_role3682_e469.arn
}

resource "aws_iam_role" "realtime_task_def_execution_role578_aa7_f5" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "realtime_task_def_execution_role_default_policy_d46_a3_dcc" {
  policy = {
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect = "Allow"
        Resource = aws_cloudwatch_log_group.realtime_logs5_c43159_d.arn
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.cookie_signing_secret_e5797145.id
      }
    ]
    Version = "2012-10-17"
  }
  name = "RealtimeTaskDefExecutionRoleDefaultPolicyD46A3DCC"
  // CF Property(Roles) = [
  //   aws_iam_role.realtime_task_def_execution_role578_aa7_f5.arn
  // ]
}

resource "aws_cloudwatch_log_group" "realtime_logs5_c43159_d" {
  retention_in_days = 30
}

resource "aws_ecs_service" "realtime_service_a39_af596" {
  cluster = aws_ecs_cluster.cluster_eb0386_a7.arn
  // CF Property(DeploymentConfiguration) = {
  //   Alarms = {
  //     AlarmNames = [
  //     ]
  //     Enable = false
  //     Rollback = false
  //   }
  //   DeploymentCircuitBreaker = {
  //     Enable = true
  //     Rollback = true
  //   }
  //   MaximumPercent = 200
  //   MinimumHealthyPercent = 50
  // }
  deployment_controller {
    type = "ECS"
  }
  desired_count = local.RealtimeServiceEnabled18ED891C ? null : 0
  enable_ecs_managed_tags = true
  launch_type = "FARGATE"
  network_configuration {
    // CF Property(AwsvpcConfiguration) = {
    //   AssignPublicIp = "DISABLED"
    //   SecurityGroups = [
    //     aws_security_group.realtime_service_security_group8_e245_e7_e.id
    //   ]
    //   Subnets = [
    //     aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
    //     aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
    //   ]
    // }
  }
  propagate_tags = "SERVICE"
  service_registries = [
    {
      container_name = "app"
      container_port = 4000
      registry_arn = aws_service_discovery_service.realtime_service_cloudmap_service_bbba4_a23.arn
    }
  ]
  task_definition = aws_ecs_task_definition.realtime_task_def9_e0_dd838.arn
}

resource "aws_security_group" "realtime_service_security_group8_e245_e7_e" {
  description = "Supabase/Realtime/Service/SecurityGroup"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_vpc_security_group_ingress_rule" "realtime_service_security_groupfrom_supabase_realtime_service_security_group570992_fealltraffic599_b2469" {
  description = "from SupabaseRealtimeServiceSecurityGroup570992FE:ALL TRAFFIC"
  referenced_security_group_id = aws_security_group.realtime_service_security_group8_e245_e7_e.id
  ip_protocol = "-1"
  security_group_id = aws_security_group.realtime_service_security_group8_e245_e7_e.id
}

resource "aws_vpc_security_group_ingress_rule" "realtime_service_security_groupfrom_supabase_kong_service_security_group_b3_c4_ac8_f40007_d995_f01" {
  description = "from SupabaseKongServiceSecurityGroupB3C4AC8F:4000"
  from_port = 4000
  referenced_security_group_id = aws_security_group.realtime_service_security_group8_e245_e7_e.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.kong_service_security_group_e199_ee6_c.id
  to_port = 4000
}

resource "aws_service_discovery_service" "realtime_service_cloudmap_service_bbba4_a23" {
  dns_config = {
    DnsRecords = [
      {
        TTL = 10
        Type = "SRV"
      },
      {
        Type = "A"
        TTL = 10
      }
    ]
    NamespaceId = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
    RoutingPolicy = "MULTIVALUE"
  }
  health_check_custom_config {
    failure_threshold = 1
  }
  name = "realtime-dev"
  namespace_id = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
}

resource "aws_appautoscaling_target" "realtime_service_task_count_target89349_cd4" {
  count = local.RealtimeAutoScalingEnabled7991ED3B ? 1 : 0
  max_capacity = 20
  min_capacity = 2
  resource_id = join("", ["service/", aws_ecs_cluster.cluster_eb0386_a7.arn, "/", aws_ecs_service.realtime_service_a39_af596.name])
  role_arn = join("", ["arn:", data.aws_partition.current.partition, ":iam::", data.aws_caller_identity.current.account_id, ":role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"])
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"
}

resource "aws_appautoscaling_policy" "realtime_service_task_count_target_scale_on_cpu764115_ff" {
  count = local.RealtimeAutoScalingEnabled7991ED3B ? 1 : 0
  name = "SupabaseRealtimeServiceTaskCountTargetScaleOnCpu2482C1E2"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.realtime_service_task_count_target89349_cd4[0].arn
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification = {
      PredefinedMetricType = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown = 60
    scale_out_cooldown = 60
    target_value = 50
  }
}

resource "aws_s3_bucket" "bucket83908_e77" {
  bucket = {
    ServerSideEncryptionConfiguration = [
      {
        ServerSideEncryptionByDefault = {
          SSEAlgorithm = "AES256"
        }
      }
    ]
  }
  // CF Property(PublicAccessBlockConfiguration) = {
  //   BlockPublicAcls = true
  //   BlockPublicPolicy = true
  //   IgnorePublicAcls = true
  //   RestrictPublicBuckets = true
  // }
}

resource "aws_iam_role" "imgproxy_task_def_task_role_b88_d5_b6_d" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_ecs_task_definition" "imgproxy_task_def33_bf8_cea" {
  container_definitions = [
    {
      Environment = [
        {
          Name = "IMGPROXY_BIND"
          Value = ":5001"
        },
        {
          Name = "IMGPROXY_LOCAL_FILESYSTEM_ROOT"
          Value = "/"
        },
        {
          Name = "IMGPROXY_USE_ETAG"
          Value = "true"
        },
        {
          Name = "IMGPROXY_ENABLE_WEBP_DETECTION"
          Value = "true"
        }
      ]
      Essential = true
      HealthCheck = {
        Command = [
          "CMD",
          "imgproxy",
          "health"
        ]
        Interval = 5
        Retries = 3
        Timeout = 5
      }
      Image = var.imgproxy_image_uri
      LogConfiguration = {
        LogDriver = "awslogs"
        Options = {
          awslogs-group = aws_cloudwatch_log_group.imgproxy_logs00_a67_bbb.arn
          awslogs-stream-prefix = "ecs"
          awslogs-region = data.aws_region.current.name
        }
      }
      Name = "app"
      PortMappings = [
        {
          ContainerPort = 5001
          Name = "http"
          Protocol = "tcp"
        }
      ]
      Ulimits = [
        {
          HardLimit = 65536
          Name = "nofile"
          SoftLimit = 65536
        }
      ]
    }
  ]
  cpu = local.mappings["TaskSize"][var.imgproxy_task_size5_d0_dd9_f6]["cpu"]
  execution_role_arn = aws_iam_role.imgproxy_task_def_execution_role_e676_fd35.arn
  family = "SupabaseImgproxyTaskDef08EEF13B"
  memory = local.mappings["TaskSize"][var.imgproxy_task_size5_d0_dd9_f6]["memory"]
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"
  ]
  runtime_platform {
    cpu_architecture = "ARM64"
    operating_system_family = "LINUX"
  }
  task_role_arn = aws_iam_role.imgproxy_task_def_task_role_b88_d5_b6_d.arn
}

resource "aws_iam_role" "imgproxy_task_def_execution_role_e676_fd35" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "imgproxy_task_def_execution_role_default_policy28511_dda" {
  policy = {
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect = "Allow"
        Resource = aws_cloudwatch_log_group.imgproxy_logs00_a67_bbb.arn
      }
    ]
    Version = "2012-10-17"
  }
  name = "ImgproxyTaskDefExecutionRoleDefaultPolicy28511DDA"
  // CF Property(Roles) = [
  //   aws_iam_role.imgproxy_task_def_execution_role_e676_fd35.arn
  // ]
}

resource "aws_cloudwatch_log_group" "imgproxy_logs00_a67_bbb" {
  retention_in_days = 30
}

resource "aws_ecs_service" "imgproxy_service_c5851888" {
  cluster = aws_ecs_cluster.cluster_eb0386_a7.arn
  // CF Property(DeploymentConfiguration) = {
  //   Alarms = {
  //     AlarmNames = [
  //     ]
  //     Enable = false
  //     Rollback = false
  //   }
  //   DeploymentCircuitBreaker = {
  //     Enable = true
  //     Rollback = true
  //   }
  //   MaximumPercent = 200
  //   MinimumHealthyPercent = 50
  // }
  deployment_controller {
    type = "ECS"
  }
  desired_count = local.ImgproxyServiceEnabled64E773FC ? null : 0
  enable_ecs_managed_tags = true
  launch_type = "FARGATE"
  network_configuration {
    // CF Property(AwsvpcConfiguration) = {
    //   AssignPublicIp = "DISABLED"
    //   SecurityGroups = [
    //     aws_security_group.imgproxy_service_security_group_dd73_de99.id
    //   ]
    //   Subnets = [
    //     aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
    //     aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
    //   ]
    // }
  }
  propagate_tags = "SERVICE"
  service_registries = [
    {
      container_name = "app"
      container_port = 5001
      registry_arn = aws_service_discovery_service.imgproxy_service_cloudmap_service9_c9565_a1.arn
    }
  ]
  task_definition = aws_ecs_task_definition.imgproxy_task_def33_bf8_cea.arn
}

resource "aws_security_group" "imgproxy_service_security_group_dd73_de99" {
  description = "Supabase/Imgproxy/Service/SecurityGroup"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_vpc_security_group_ingress_rule" "imgproxy_service_security_groupfrom_supabase_storage_service_security_group_adf822_d450011_e6_fa973" {
  description = "from SupabaseStorageServiceSecurityGroupADF822D4:5001"
  from_port = 5001
  referenced_security_group_id = aws_security_group.imgproxy_service_security_group_dd73_de99.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.storage_service_security_group_f6280_dc0.id
  to_port = 5001
}

resource "aws_service_discovery_service" "imgproxy_service_cloudmap_service9_c9565_a1" {
  dns_config = {
    DnsRecords = [
      {
        TTL = 10
        Type = "SRV"
      },
      {
        Type = "A"
        TTL = 10
      }
    ]
    NamespaceId = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
    RoutingPolicy = "MULTIVALUE"
  }
  health_check_custom_config {
    failure_threshold = 1
  }
  name = "imgproxy"
  namespace_id = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
}

resource "aws_appautoscaling_target" "imgproxy_service_task_count_target_c19355_bf" {
  count = local.ImgproxyAutoScalingEnabled44E9E87F ? 1 : 0
  max_capacity = 20
  min_capacity = 2
  resource_id = join("", ["service/", aws_ecs_cluster.cluster_eb0386_a7.arn, "/", aws_ecs_service.imgproxy_service_c5851888.name])
  role_arn = join("", ["arn:", data.aws_partition.current.partition, ":iam::", data.aws_caller_identity.current.account_id, ":role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"])
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"
}

resource "aws_appautoscaling_policy" "imgproxy_service_task_count_target_scale_on_cpu_ade19_fc6" {
  count = local.ImgproxyAutoScalingEnabled44E9E87F ? 1 : 0
  name = "SupabaseImgproxyServiceTaskCountTargetScaleOnCpu2F1B6C7E"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.imgproxy_service_task_count_target_c19355_bf[0].arn
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification = {
      PredefinedMetricType = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown = 60
    scale_out_cooldown = 60
    target_value = 50
  }
}

resource "aws_iam_role" "storage_task_def_task_role_fb709706" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "storage_task_def_task_role_default_policy0587_c2_f8" {
  policy = {
    Statement = [
      {
        Action = [
          "s3:GetObject*",
          "s3:GetBucket*",
          "s3:List*",
          "s3:DeleteObject*",
          "s3:PutObject",
          "s3:PutObjectLegalHold",
          "s3:PutObjectRetention",
          "s3:PutObjectTagging",
          "s3:PutObjectVersionTagging",
          "s3:Abort*"
        ]
        Effect = "Allow"
        Resource = [
          aws_s3_bucket.bucket83908_e77.arn,
          join("", [aws_s3_bucket.bucket83908_e77.arn, "/*"])
        ]
      }
    ]
    Version = "2012-10-17"
  }
  name = "StorageTaskDefTaskRoleDefaultPolicy0587C2F8"
  // CF Property(Roles) = [
  //   aws_iam_role.storage_task_def_task_role_fb709706.arn
  // ]
}

resource "aws_ecs_task_definition" "storage_task_def36011_ffa" {
  container_definitions = [
    {
      Environment = [
        {
          Name = "POSTGREST_URL"
          Value = "http://rest.supabase.internal:3000"
        },
        {
          Name = "PGOPTIONS"
          Value = "-c search_path=storage,public"
        },
        {
          Name = "FILE_SIZE_LIMIT"
          Value = "52428800"
        },
        {
          Name = "STORAGE_BACKEND"
          Value = "s3"
        },
        {
          Name = "TENANT_ID"
          Value = "stub"
        },
        {
          Name = "IS_MULTITENANT"
          Value = "false"
        },
        {
          Name = "REGION"
          Value = data.aws_region.current.name
        },
        {
          Name = "GLOBAL_S3_BUCKET"
          Value = aws_s3_bucket.bucket83908_e77.id
        },
        {
          Name = "ENABLE_IMAGE_TRANSFORMATION"
          Value = "true"
        },
        {
          Name = "IMGPROXY_URL"
          Value = "http://imgproxy.supabase.internal:5001"
        },
        {
          Name = "WEBHOOK_URL"
          Value = aws_lambda_alias.cdn_cache_manager_api_function_function_url37928_fc6.function_name
        },
        {
          Name = "ENABLE_QUEUE_EVENTS"
          Value = "false"
        }
      ]
      Essential = true
      HealthCheck = {
        Command = [
          "CMD",
          "wget",
          "--no-verbose",
          "--tries=1",
          "--spider",
          "http://localhost:5000/status"
        ]
        Interval = 5
        Retries = 3
        Timeout = 5
      }
      Image = var.storage_image_uri
      LogConfiguration = {
        LogDriver = "awslogs"
        Options = {
          awslogs-group = aws_cloudwatch_log_group.storage_logs2_a2_d4_d26.arn
          awslogs-stream-prefix = "ecs"
          awslogs-region = data.aws_region.current.name
        }
      }
      Name = "app"
      PortMappings = [
        {
          ContainerPort = 5000
          Name = "http"
          Protocol = "tcp"
        }
      ]
      Secrets = [
        {
          Name = "ANON_KEY"
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_anon_key_parameter532_dcc06.arn])
        },
        {
          Name = "SERVICE_KEY"
          ValueFrom = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_service_role_key_parameter_b65536_eb.arn])
        },
        {
          Name = "PGRST_JWT_SECRET"
          ValueFrom = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
        },
        {
          Name = "DATABASE_URL"
          ValueFrom = join("", [aws_secretsmanager_secret.databasesupabasestorageadmin_secret88_c76_aa3.id, ":uri::"])
        },
        {
          Name = "WEBHOOK_API_KEY"
          ValueFrom = aws_secretsmanager_secret.cdn_cache_manager_api_key137_d2795.id
        }
      ]
      Ulimits = [
        {
          HardLimit = 65536
          Name = "nofile"
          SoftLimit = 65536
        }
      ]
    }
  ]
  cpu = local.mappings["TaskSize"][var.storage_task_size_b82_d9_cfb]["cpu"]
  execution_role_arn = aws_iam_role.storage_task_def_execution_role_a2_ef27_e4.arn
  family = "SupabaseStorageTaskDef9FD687B2"
  memory = local.mappings["TaskSize"][var.storage_task_size_b82_d9_cfb]["memory"]
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"
  ]
  runtime_platform {
    cpu_architecture = "ARM64"
    operating_system_family = "LINUX"
  }
  task_role_arn = aws_iam_role.storage_task_def_task_role_fb709706.arn
}

resource "aws_iam_role" "storage_task_def_execution_role_a2_ef27_e4" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "storage_task_def_execution_role_default_policy_cfbb4_b95" {
  policy = {
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect = "Allow"
        Resource = aws_cloudwatch_log_group.storage_logs2_a2_d4_d26.arn
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_anon_key_parameter532_dcc06.arn])
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_service_role_key_parameter_b65536_eb.arn])
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.jwt_secret_b8834_b39.id
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.databasesupabasestorageadmin_secret88_c76_aa3.id
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.cdn_cache_manager_api_key137_d2795.id
      }
    ]
    Version = "2012-10-17"
  }
  name = "StorageTaskDefExecutionRoleDefaultPolicyCFBB4B95"
  // CF Property(Roles) = [
  //   aws_iam_role.storage_task_def_execution_role_a2_ef27_e4.arn
  // ]
}

resource "aws_cloudwatch_log_group" "storage_logs2_a2_d4_d26" {
  retention_in_days = 30
}

resource "aws_ecs_service" "storage_service1_cff47_fc" {
  cluster = aws_ecs_cluster.cluster_eb0386_a7.arn
  // CF Property(DeploymentConfiguration) = {
  //   Alarms = {
  //     AlarmNames = [
  //     ]
  //     Enable = false
  //     Rollback = false
  //   }
  //   DeploymentCircuitBreaker = {
  //     Enable = true
  //     Rollback = true
  //   }
  //   MaximumPercent = 200
  //   MinimumHealthyPercent = 50
  // }
  deployment_controller {
    type = "ECS"
  }
  desired_count = local.StorageServiceEnabled58819374 ? null : 0
  enable_ecs_managed_tags = true
  launch_type = "FARGATE"
  network_configuration {
    // CF Property(AwsvpcConfiguration) = {
    //   AssignPublicIp = "DISABLED"
    //   SecurityGroups = [
    //     aws_security_group.storage_service_security_group_f6280_dc0.id
    //   ]
    //   Subnets = [
    //     aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
    //     aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
    //   ]
    // }
  }
  propagate_tags = "SERVICE"
  service_registries = [
    {
      container_name = "app"
      container_port = 5000
      registry_arn = aws_service_discovery_service.storage_service_cloudmap_service524_ec31_c.arn
    }
  ]
  task_definition = aws_ecs_task_definition.storage_task_def36011_ffa.arn
}

resource "aws_security_group" "storage_service_security_group_f6280_dc0" {
  description = "Supabase/Storage/Service/SecurityGroup"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_vpc_security_group_ingress_rule" "storage_service_security_groupfrom_supabase_kong_service_security_group_b3_c4_ac8_f50000996_d63_b" {
  description = "from SupabaseKongServiceSecurityGroupB3C4AC8F:5000"
  from_port = 5000
  referenced_security_group_id = aws_security_group.storage_service_security_group_f6280_dc0.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.kong_service_security_group_e199_ee6_c.id
  to_port = 5000
}

resource "aws_service_discovery_service" "storage_service_cloudmap_service524_ec31_c" {
  dns_config = {
    DnsRecords = [
      {
        TTL = 10
        Type = "SRV"
      },
      {
        Type = "A"
        TTL = 10
      }
    ]
    NamespaceId = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
    RoutingPolicy = "MULTIVALUE"
  }
  health_check_custom_config {
    failure_threshold = 1
  }
  name = "storage"
  namespace_id = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
}

resource "aws_appautoscaling_target" "storage_service_task_count_target_af72160_a" {
  count = local.StorageAutoScalingEnabled4D34646B ? 1 : 0
  max_capacity = 20
  min_capacity = 2
  resource_id = join("", ["service/", aws_ecs_cluster.cluster_eb0386_a7.arn, "/", aws_ecs_service.storage_service1_cff47_fc.name])
  role_arn = join("", ["arn:", data.aws_partition.current.partition, ":iam::", data.aws_caller_identity.current.account_id, ":role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"])
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"
}

resource "aws_appautoscaling_policy" "storage_service_task_count_target_scale_on_cpu_db3_b903_c" {
  count = local.StorageAutoScalingEnabled4D34646B ? 1 : 0
  name = "SupabaseStorageServiceTaskCountTargetScaleOnCpuE2C72C87"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.storage_service_task_count_target_af72160_a[0].arn
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification = {
      PredefinedMetricType = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown = 60
    scale_out_cooldown = 60
    target_value = 50
  }
}

resource "aws_iam_role" "meta_task_def_task_role_c662_b431" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_ecs_task_definition" "meta_task_def2_c490_dd3" {
  container_definitions = [
    {
      Environment = [
        {
          Name = "PG_META_PORT"
          Value = "8080"
        },
        {
          Name = "PG_META_DB_HOST"
          Value =           // Unable to resolve Fn::GetAtt with value: [
          //   "DatabaseCluster5B53A178",
          //   "Endpoint.Address"
          // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
        },
        {
          Name = "PG_META_DB_PORT"
          Value =           // Unable to resolve Fn::GetAtt with value: [
          //   "DatabaseCluster5B53A178",
          //   "Endpoint.Port"
          // ] because Unable to solve nested GetAttr Endpoint for database_cluster5_b53_a178 and aws_rds_cluster
        }
      ]
      Essential = true
      Image = var.postgres_meta_image_uri
      LogConfiguration = {
        LogDriver = "awslogs"
        Options = {
          awslogs-group = aws_cloudwatch_log_group.meta_logs80_fd71_c7.arn
          awslogs-stream-prefix = "ecs"
          awslogs-region = data.aws_region.current.name
        }
      }
      Name = "app"
      PortMappings = [
        {
          ContainerPort = 8080
          Name = "http"
          Protocol = "tcp"
        }
      ]
      Secrets = [
        {
          Name = "PG_META_DB_NAME"
          ValueFrom = join("", [aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id, ":dbname::"])
        },
        {
          Name = "PG_META_DB_USER"
          ValueFrom = join("", [aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id, ":username::"])
        },
        {
          Name = "PG_META_DB_PASSWORD"
          ValueFrom = join("", [aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id, ":password::"])
        }
      ]
      Ulimits = [
        {
          HardLimit = 65536
          Name = "nofile"
          SoftLimit = 65536
        }
      ]
    }
  ]
  cpu = local.mappings["TaskSize"][var.meta_task_size556_d36_d9]["cpu"]
  execution_role_arn = aws_iam_role.meta_task_def_execution_role959286_b6.arn
  family = "SupabaseMetaTaskDef48FB78F0"
  memory = local.mappings["TaskSize"][var.meta_task_size556_d36_d9]["memory"]
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"
  ]
  runtime_platform {
    cpu_architecture = "ARM64"
    operating_system_family = "LINUX"
  }
  task_role_arn = aws_iam_role.meta_task_def_task_role_c662_b431.arn
}

resource "aws_iam_role" "meta_task_def_execution_role959286_b6" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "meta_task_def_execution_role_default_policy60_f100_a8" {
  policy = {
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect = "Allow"
        Resource = aws_cloudwatch_log_group.meta_logs80_fd71_c7.arn
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret_rotation.database_cluster_secret_attachment_dc8466_c0.id
      }
    ]
    Version = "2012-10-17"
  }
  name = "MetaTaskDefExecutionRoleDefaultPolicy60F100A8"
  // CF Property(Roles) = [
  //   aws_iam_role.meta_task_def_execution_role959286_b6.arn
  // ]
}

resource "aws_cloudwatch_log_group" "meta_logs80_fd71_c7" {
  retention_in_days = 30
}

resource "aws_ecs_service" "meta_service2_be3_a4_cf" {
  cluster = aws_ecs_cluster.cluster_eb0386_a7.arn
  // CF Property(DeploymentConfiguration) = {
  //   Alarms = {
  //     AlarmNames = [
  //     ]
  //     Enable = false
  //     Rollback = false
  //   }
  //   DeploymentCircuitBreaker = {
  //     Enable = true
  //     Rollback = true
  //   }
  //   MaximumPercent = 200
  //   MinimumHealthyPercent = 50
  // }
  deployment_controller {
    type = "ECS"
  }
  desired_count = local.MetaServiceEnabled094DCF06 ? null : 0
  enable_ecs_managed_tags = true
  launch_type = "FARGATE"
  network_configuration {
    // CF Property(AwsvpcConfiguration) = {
    //   AssignPublicIp = "DISABLED"
    //   SecurityGroups = [
    //     aws_security_group.meta_service_security_group0_e39_df35.id
    //   ]
    //   Subnets = [
    //     aws_subnet.vpc_private_subnet1_subnet8_bca10_e0.id,
    //     aws_subnet.vpc_private_subnet2_subnet_cfcdaa7_a.id
    //   ]
    // }
  }
  propagate_tags = "SERVICE"
  service_registries = [
    {
      container_name = "app"
      container_port = 8080
      registry_arn = aws_service_discovery_service.meta_service_cloudmap_service638956_cc.arn
    }
  ]
  task_definition = aws_ecs_task_definition.meta_task_def2_c490_dd3.arn
}

resource "aws_security_group" "meta_service_security_group0_e39_df35" {
  description = "Supabase/Meta/Service/SecurityGroup"
  egress = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic by default"
      protocol = "-1"
    }
  ]
  vpc_id = vpc_id_cost //aws_vpc.vpcb9_e5_f0_b4.arn
}

resource "aws_vpc_security_group_ingress_rule" "meta_service_security_groupfrom_supabase_kong_service_security_group_b3_c4_ac8_f80805_ad2_c559" {
  description = "from SupabaseKongServiceSecurityGroupB3C4AC8F:8080"
  from_port = 8080
  referenced_security_group_id = aws_security_group.meta_service_security_group0_e39_df35.id
  ip_protocol = "tcp"
  security_group_id = aws_security_group.kong_service_security_group_e199_ee6_c.id
  to_port = 8080
}

resource "aws_service_discovery_service" "meta_service_cloudmap_service638956_cc" {
  dns_config = {
    DnsRecords = [
      {
        TTL = 10
        Type = "SRV"
      },
      {
        Type = "A"
        TTL = 10
      }
    ]
    NamespaceId = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
    RoutingPolicy = "MULTIVALUE"
  }
  health_check_custom_config {
    failure_threshold = 1
  }
  name = "meta"
  namespace_id = aws_service_discovery_private_dns_namespace.cluster_default_service_discovery_namespace_c336_f9_b4.id
}

resource "aws_appautoscaling_target" "meta_service_task_count_target124_c5_bfa" {
  count = local.MetaAutoScalingEnabledCF28EDB1 ? 1 : 0
  max_capacity = 20
  min_capacity = 2
  resource_id = join("", ["service/", aws_ecs_cluster.cluster_eb0386_a7.arn, "/", aws_ecs_service.meta_service2_be3_a4_cf.name])
  role_arn = join("", ["arn:", data.aws_partition.current.partition, ":iam::", data.aws_caller_identity.current.account_id, ":role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"])
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"
}

resource "aws_appautoscaling_policy" "meta_service_task_count_target_scale_on_cpu_bfdcf132" {
  count = local.MetaAutoScalingEnabledCF28EDB1 ? 1 : 0
  name = "SupabaseMetaServiceTaskCountTargetScaleOnCpuB433E25D"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.meta_service_task_count_target124_c5_bfa[0].arn
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification = {
      PredefinedMetricType = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown = 60
    scale_out_cooldown = 60
    target_value = 50
  }
}

resource "aws_iam_role" "force_deploy_job_state_machine_role_b8306_d93" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = local.mappings["ServiceprincipalMap"][data.aws_region.current.name]["states"]
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "force_deploy_job_state_machine_role_default_policy_d8_b5_c2_e1" {
  policy = {
    Statement = [
      {
        Action = "ecs:ListServices"
        Effect = "Allow"
        Resource = "*"
      },
      {
        Action = "ecs:UpdateService"
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ecs:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":service/", aws_ecs_cluster.cluster_eb0386_a7.arn, "/*"])
      }
    ]
    Version = "2012-10-17"
  }
  name = "ForceDeployJobStateMachineRoleDefaultPolicyD8B5C2E1"
  // CF Property(Roles) = [
  //   aws_iam_role.force_deploy_job_state_machine_role_b8306_d93.arn
  // ]
}

resource "aws_sfn_state_machine" "force_deploy_job_state_machine528644_b1" {
  definition = join("", ["{"StartAt":"CheckInput","States":{"CheckInput":{"Type":"Choice","Choices":[{"Variable":"$.services","IsPresent":true,"Next":"ForceDeployment"}],"Default":"GetEcsServiceList"},"GetEcsServiceList":{"Next":"ForceDeployment","Type":"Task","Comment":"Fetch ECS Services","ResultSelector":{"services.$":"$.ServiceArns"},"Resource":"arn:", data.aws_partition.current.partition, ":states:::aws-sdk:ecs:listServices","Parameters":{"Cluster":"", aws_ecs_cluster.cluster_eb0386_a7.arn, ""}},"ForceDeployment":{"Type":"Map","End":true,"Parameters":{"service.$":"$$.Map.Item.Value"},"Iterator":{"StartAt":"ForceDeployEcsTask","States":{"ForceDeployEcsTask":{"End":true,"Type":"Task","Comment":"Force deploy ECS Tasks","Resource":"arn:", data.aws_partition.current.partition, ":states:::aws-sdk:ecs:updateService","Parameters":{"Cluster":"", aws_ecs_cluster.cluster_eb0386_a7.arn, "","Service.$":"$.service","ForceNewDeployment":true}}}},"ItemsPath":"$.services"}}}"])
  role_arn = aws_iam_role.force_deploy_job_state_machine_role_b8306_d93.arn
}

resource "aws_iam_role" "force_deploy_job_state_machine_events_role3137_ab10" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
}

resource "aws_iam_policy" "force_deploy_job_state_machine_events_role_default_policy485_fd53_c" {
  policy = {
    Statement = [
      {
        Action = "states:StartExecution"
        Effect = "Allow"
        Resource = aws_sfn_state_machine.force_deploy_job_state_machine528644_b1.id
      }
    ]
    Version = "2012-10-17"
  }
  name = "ForceDeployJobStateMachineEventsRoleDefaultPolicy485FD53C"
  // CF Property(Roles) = [
  //   aws_iam_role.force_deploy_job_state_machine_events_role3137_ab10.arn
  // ]
}

resource "aws_cloudwatch_event_rule" "auth_parameter_changed2_fc322_f1" {
  description = "Supabase - Auth parameter changed"
  event_pattern = {
    source = [
      "aws.ssm"
    ]
    detail-type = [
      "Parameter Store Change"
    ]
    detail = {
      name = [
        {
          prefix = join("", ["/", local.stack_name, "/Auth/"])
        }
      ]
      operation = [
        "Update"
      ]
    }
  }
  state = "ENABLED"
  // CF Property(Targets) = [
  //   {
  //     Arn = aws_sfn_state_machine.force_deploy_job_state_machine528644_b1.id
  //     Id = "Target0"
  //     Input = join("", ["{"services":["", aws_ecs_service.auth_service_ba690728.id, ""]}"])
  //     RoleArn = aws_iam_role.force_deploy_job_state_machine_events_role3137_ab10.arn
  //   }
  // ]
}

resource "aws_codecommit_repository" "studio_repository_e0_effbe2" {
  description = "Supabase/Studio/Repository"
  repository_name = local.stack_name
}

resource "aws_iam_role" "studio_repository_import_function_service_role_c6_b8_ed58" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_iam_policy" "studio_repository_import_function_service_role_default_policy_a3265637" {
  policy = {
    Statement = [
      {
        Action = "codecommit:GitPull"
        Effect = "Allow"
        Resource = aws_codecommit_repository.studio_repository_e0_effbe2.arn
      },
      {
        Action = "codecommit:GitPush"
        Effect = "Allow"
        Resource = aws_codecommit_repository.studio_repository_e0_effbe2.arn
      }
    ]
    Version = "2012-10-17"
  }
  name = "StudioRepositoryImportFunctionServiceRoleDefaultPolicyA3265637"
  // CF Property(Roles) = [
  //   aws_iam_role.studio_repository_import_function_service_role_c6_b8_ed58.arn
  // ]
}

resource "aws_lambda_function" "studio_repository_import_function_f87_c7_d62" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/9f3f18af1863bba5966d593a9787c1672fb7493177bf2897d8ffa2be2fc2b397.zip"
  }
  description = "Clone to CodeCommit from remote repo (You can execute this function manually.)"
  environment {
    variables = {
      TARGET_REPO = join("", ["codecommit::", data.aws_region.current.name, "://", aws_codecommit_repository.studio_repository_e0_effbe2.repository_name])
      SOURCE_REPO = "https://github.com/supabase/supabase.git"
      SOURCE_BRANCH = var.studio_branch
      TARGET_BRANCH = "main"
    }
  }
  ephemeral_storage {
    size = 3072
  }
  handler = "index.handler"
  memory_size = 4096
  role = aws_iam_role.studio_repository_import_function_service_role_c6_b8_ed58.arn
  runtime = "python3.12"
  timeout = 900
}

resource "aws_iam_role" "studio_repository_import_providerframeworkon_event_service_role_abeb03_cc" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  managed_policy_arns = [
    join("", ["arn:", data.aws_partition.current.partition, ":iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  ]
}

resource "aws_iam_policy" "studio_repository_import_providerframeworkon_event_service_role_default_policy0_fb1_a847" {
  policy = {
    Statement = [
      {
        Action = "lambda:InvokeFunction"
        Effect = "Allow"
        Resource = [
          aws_lambda_function.studio_repository_import_function_f87_c7_d62.arn,
          join("", [aws_lambda_function.studio_repository_import_function_f87_c7_d62.arn, ":*"])
        ]
      }
    ]
    Version = "2012-10-17"
  }
  name = "StudioRepositoryImportProviderframeworkonEventServiceRoleDefaultPolicy0FB1A847"
  // CF Property(Roles) = [
  //   aws_iam_role.studio_repository_import_providerframeworkon_event_service_role_abeb03_cc.arn
  // ]
}

resource "aws_lambda_function" "studio_repository_import_providerframeworkon_event_fed45_cdf" {
  code_signing_config_arn = {
    S3Bucket = "supabase-on-aws-${data.aws_region.current.name}"
    S3Key = "stable/7382a0addb9f34974a1ea6c6c9b063882af874828f366f5c93b2b7b64db15c94.zip"
  }
  description = "AWS CDK resource provider framework - onEvent (Supabase/Studio/Repository/ImportProvider)"
  environment {
    variables = {
      USER_ON_EVENT_FUNCTION_ARN = aws_lambda_function.studio_repository_import_function_f87_c7_d62.arn
    }
  }
  handler = "framework.onEvent"
  role = aws_iam_role.studio_repository_import_providerframeworkon_event_service_role_abeb03_cc.arn
  runtime = "nodejs18.x"
  timeout = 900
}

resource "aws_customerprofiles_profile" "studio_repositorymain62_c45_c74" {
  // CF Property(ServiceToken) = aws_lambda_function.studio_repository_import_providerframeworkon_event_fed45_cdf.arn
  // CF Property(SourceRepo) = "https://github.com/supabase/supabase.git"
  // CF Property(SourceBranch) = var.studio_branch
}

resource "aws_iam_role" "studio_role199_eaf11" {
  assume_role_policy = {
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "amplify.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  }
  description = "The service role that will be used by AWS Amplify for SSR app logging."
  path = "/service-role/"
}

resource "aws_iam_policy" "studio_role_default_policy289_cec37" {
  policy = {
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect = "Allow"
        Resource = aws_secretsmanager_secret.databasedashboarduser_secret102_d2_f3_b.id
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_anon_key_parameter532_dcc06.arn])
      },
      {
        Action = [
          "ssm:DescribeParameters",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:GetParameterHistory"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":ssm:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":parameter", aws_ssm_parameter.jwt_secret_service_role_key_parameter_b65536_eb.arn])
      },
      {
        Action = "codecommit:GitPull"
        Effect = "Allow"
        Resource = aws_codecommit_repository.studio_repository_e0_effbe2.arn
      }
    ]
    Version = "2012-10-17"
  }
  name = "StudioRoleDefaultPolicy289CEC37"
  // CF Property(Roles) = [
  //   aws_iam_role.studio_role199_eaf11.arn
  // ]
}

resource "aws_amplify_app" "studio_app_e10_a3450" {
  auto_branch_creation_config = {
    EnableBasicAuth = false
  }
  build_spec = join("", ["version: 1
applications:
  - appRoot: studio
    frontend:
      phases:
        preBuild:
          commands:
            - echo POSTGRES_PASSWORD=$(aws secretsmanager get-secret-value --secret-id $DB_SECRET_ARN --query SecretString | jq -r . | jq -r .password) >> .env.production
            - echo SUPABASE_ANON_KEY=$(aws ssm get-parameter --region $SUPABASE_REGION --name $ANON_KEY_NAME --query Parameter.Value) >> .env.production
            - echo SUPABASE_SERVICE_KEY=$(aws ssm get-parameter --region $SUPABASE_REGION --name $SERVICE_KEY_NAME --query Parameter.Value) >> .env.production
            - env | grep -e STUDIO_PG_META_URL >> .env.production
            - env | grep -e SUPABASE_ >> .env.production
            - env | grep -e NEXT_PUBLIC_ >> .env.production
            - cd ../
            - npx turbo@1.10.3 prune --scope=studio
            - npm clean-install
        build:
          commands:
            - npx turbo run build --scope=studio --include-dependencies --no-deps
            - npm prune --omit=dev
        postBuild:
          commands:
            - cd studio
            - rsync -av --ignore-existing .next/standalone/", aws_codecommit_repository.studio_repository_e0_effbe2.repository_name, "/studio/ .next/standalone/
            - rsync -av --ignore-existing .next/standalone/", aws_codecommit_repository.studio_repository_e0_effbe2.repository_name, "/node_modules/ .next/standalone/node_modules/
            - rm -rf .next/standalone/", aws_codecommit_repository.studio_repository_e0_effbe2.repository_name, "
            - cp .env .env.production .next/standalone/
            - rsync -av --ignore-existing public/ .next/standalone/public/
            - rsync -av --ignore-existing .next/static/ .next/standalone/.next/static/
      artifacts:
        baseDirectory: .next
        files:
          - "**/*"
      cache:
        paths:
          - node_modules/**/*
"])
  custom_rule = [
    {
      Source = "/<*>"
      Status = "404-200"
      Target = "/index.html"
    }
  ]
  environment_variables = [
    {
      Name = "NODE_OPTIONS"
      Value = "--max-old-space-size=4096"
    },
    {
      Name = "AMPLIFY_MONOREPO_APP_ROOT"
      Value = "studio"
    },
    {
      Name = "AMPLIFY_DIFF_DEPLOY"
      Value = "false"
    },
    {
      Name = "_CUSTOM_IMAGE"
      Value = "public.ecr.aws/sam/build-nodejs18.x:latest"
    },
    {
      Name = "STUDIO_PG_META_URL"
      Value = join("", ["https://", aws_cloudfront_distribution.cdn_distribution149_fa6_c8.domain_name, "/pg"])
    },
    {
      Name = "SUPABASE_URL"
      Value = join("", ["https://", aws_cloudfront_distribution.cdn_distribution149_fa6_c8.domain_name])
    },
    {
      Name = "SUPABASE_PUBLIC_URL"
      Value = join("", ["https://", aws_cloudfront_distribution.cdn_distribution149_fa6_c8.domain_name])
    },
    {
      Name = "SUPABASE_REGION"
      Value = data.aws_region.current.name
    },
    {
      Name = "DB_SECRET_ARN"
      Value = aws_secretsmanager_secret.databasedashboarduser_secret102_d2_f3_b.id
    },
    {
      Name = "ANON_KEY_NAME"
      Value = aws_ssm_parameter.jwt_secret_anon_key_parameter532_dcc06.arn
    },
    {
      Name = "SERVICE_KEY_NAME"
      Value = aws_ssm_parameter.jwt_secret_service_role_key_parameter_b65536_eb.arn
    }
  ]
  iam_service_role_arn = aws_iam_role.studio_role199_eaf11.arn
  name = "SupabaseStudio"
  platform = "WEB_COMPUTE"
  repository = aws_codecommit_repository.studio_repository_e0_effbe2.clone_url_http
}

resource "aws_amplify_branch" "studio_app_prod_branch_ed7568_cb" {
  app_id = aws_amplify_app.studio_app_e10_a3450.id
  branch_name = "main"
  enable_auto_build = true
  enable_pull_request_preview = true
  environment_variables = [
    {
      Name = "NEXT_PUBLIC_SITE_URL"
      Value = join("", ["https://main.", aws_amplify_app.studio_app_e10_a3450.id, ".amplifyapp.com"])
    }
  ]
  framework = "Next.js - SSR"
  stage = "PRODUCTION"
}

resource "aws_iam_policy" "studio_amplify_ssr_logging_policy_b3151918" {
  policy = {
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":logs:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":log-group:/aws/amplify/", aws_amplify_app.studio_app_e10_a3450.id, ":log-stream:*"])
        Sid = "PushLogs"
      },
      {
        Action = "logs:CreateLogGroup"
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":logs:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":log-group:/aws/amplify/*"])
        Sid = "CreateLogGroup"
      },
      {
        Action = "logs:DescribeLogGroups"
        Effect = "Allow"
        Resource = join("", ["arn:", data.aws_partition.current.partition, ":logs:", data.aws_region.current.name, ":", data.aws_caller_identity.current.account_id, ":log-group:*"])
        Sid = "DescribeLogGroups"
      }
    ]
    Version = "2012-10-17"
  }
  name = join("", ["AmplifySSRLoggingPolicy-", aws_amplify_app.studio_app_e10_a3450.id])
  // CF Property(Roles) = [
  //   aws_iam_role.studio_role199_eaf11.arn
  // ]
}

resource "aws_ec2_instance_metadata_defaults" "cdk_metadata" {
  count = local.CDKMetadataAvailable ? 1 : 0
  // CF Property(Analytics) = "v2:deflate64:H4sIAAAAAAAA/31VW2/aMBT+LXs3WS+atMdB6LpqW8eg2ys6OAbcJnbmCxWK8t/32U5CGNUkpHM35/Kdk5usub76mF29o1c74cXLpJSbrFk54i8s36rvVNdS7QK7IEOVcMIEIdeqkE5qFYSlLwVD/LoR/CZrftc8aH8vcrbwm1Lyld8o4YLuxC21d+KJNogc9Cfd1FrNJQ1/EAyBuXtYBPJI7p6ceKUjWxh5AHt6+EEhRfC9Q8qkk6YOhe0roRxbCe6NdMd7o30dc/iv4kHtjLD2Qn8X1S0T3GZNXnrbN+iCzakmjrCF0QdZCDOq0bLPZHYUircvc7GVaujtvxqtHEklzEjXxa6EOUie2tmxK05laGd4JNdeuZbZZCqk5fogzDFrug7OlX3EfC2SjG+8pb78i5aZAoUP2BiaN591Zf9jmpOjDVnR9ycNbhQ2VvTO6LhJ0x2eTcKDso5USMNGF1uRop0wGEWcU4hK5AlNEm40/8HhwpLULSup2hS0VroQzzZ7jOSzVzw2XVKVNUud4BvpQgPqEW8d98umNHs65RxQ+SqOyPZ2TdYi32waCOSsmXn+ItwM5bLEhpjE9bnEsoYUBmaFDS2F05emX6aMGSSyEKaS1gaHuwMqXWlvuBit+KUWqdoq3AMD4ewCDAKwX5J1kpeaig0Apzh8DzgE07pGIyLCv8E2i7YUfSaP/SSGqzqfnh/Z07AGuIzEliEBX2wNNgR9wjDFaSJjcQkwY+XEF0HYQntyetswRxZGbny/kGMZ3fkD9P/0wkccRAbD0jtov+ndkGfPt4xOtZB32mJD0S10eFjVUFFE57kmkSeDw4yAVYo7JX+mQF5O1NsOBHbtsP82y6ksp6+2X+Izl6zBwFm+1/FsOCz+d7QMhya+PZIx7QASBMSr311/NB/rwXVVSTR/KWptpdOma2svofoK1W+PEceYakS4AQj2bRvmEpHH4krgP3cBlRzbrqu16Yzh1nT3k6GWPFr7yJady91QB374qv3wrvbYqg+32dWEynpP+AB+6r6A7wPtEu2MAclsSDQchOzZvj9cf8zwu3n3bKWcGJxXWYlsmehfsHW6GVgHAAA="
}

output "studio_url" {
  description = "The dashboard for Supabase projects."
  value = join("", ["https://", aws_amplify_branch.studio_app_prod_branch_ed7568_cb.branch_name, ".", aws_amplify_app.studio_app_e10_a3450.default_domain])
}

output "supabase_url" {
  description = "A RESTful endpoint for querying and managing your database."
  value = join("", ["https://", aws_cloudfront_distribution.cdn_distribution149_fa6_c8.domain_name])
}

output "supabas_anon_key" {
  description = "This key is safe to use in a browser if you have enabled Row Level Security for your tables and configured policies."
  value = aws_kms_custom_key_store.jwt_secret_anon_key63_f37_a1_e.cloud_hsm_cluster_id
}
