<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2.29.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_droplet.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet) | resource |
| [digitalocean_image.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_storage_size"></a> [block\_storage\_size](#input\_block\_storage\_size) | (Required) The size of the block storage volume in GiB. If updated, can only be expanded. | `number` | `5` | no |
| <a name="input_droplet_size"></a> [droplet\_size](#input\_droplet\_size) | the size slug of a droplet size | `string` | `"micro"` | no |
| <a name="input_floating_ip"></a> [floating\_ip](#input\_floating\_ip) | (Optional) Boolean to control whether floating IPs should be created. | `bool` | `false` | no |
| <a name="input_floating_ip_assign"></a> [floating\_ip\_assign](#input\_floating\_ip\_assign) | (Optional) Boolean controlling whether floatin IPs should be assigned to instances with Terraform. | `bool` | `true` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | The image name or slug to lookup. | `string` | `"centos-7-x64"` | no |
| <a name="input_name"></a> [name](#input\_name) | Droplet Name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Default Region | `string` | `"nyc3"` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | (Optional) A list of SSH IDs or fingerprints to enable. Use curl with the DigitalOcean API, to retrieve them. | `list` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A list of the tags to label this Droplet. A tag resource must exist before it can be associated with a Droplet. | `list` | `[]` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data passed to cloud-init | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_droplet_ipv4_address"></a> [droplet\_ipv4\_address](#output\_droplet\_ipv4\_address) | n/a |
<!-- END_TF_DOCS -->
