resource "local_file" "demo_file" {
  filename = "demo_file.txt"
  content =  "This is an example file created by Terraform."
}
