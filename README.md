Задача 1
Все значения перемещены в personal.auto.tfvars

```
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/02/src$ terraform apply -auto-approve
data.yandex_compute_image.my_image: Reading...
data.yandex_compute_image.my_image: Read complete after 5s [id=fd8ivkpagklognhslumh]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create

Terraform will perform the following actions:

.....

random_password.user_password: Creating...
random_password.user_password: Creation complete after 0s [id=none]
yandex_vpc_network.develop: Creating...
yandex_vpc_network.develop: Creation complete after 3s [id=enph02tkbffqblh6brg4]
yandex_vpc_subnet.develop-b: Creating...
yandex_vpc_subnet.develop: Creating...
yandex_vpc_subnet.develop: Creation complete after 1s [id=e9bbakibvm3duiij4gh3]
yandex_compute_instance.vm-b: Creating...
yandex_compute_instance.vm: Creating...
yandex_vpc_subnet.develop-b: Creation complete after 2s [id=e2ljm8faskmcc2t5hb4a]
yandex_compute_instance.vm-b: Still creating... [10s elapsed]
yandex_compute_instance.vm: Still creating... [10s elapsed]
yandex_compute_instance.vm-b: Still creating... [20s elapsed]
yandex_compute_instance.vm: Still creating... [20s elapsed]
yandex_compute_instance.vm-b: Still creating... [30s elapsed]
yandex_compute_instance.vm: Still creating... [30s elapsed]
yandex_compute_instance.vm-b: Still creating... [40s elapsed]
yandex_compute_instance.vm: Still creating... [40s elapsed]
yandex_compute_instance.vm-b: Creation complete after 46s [id=fhm5gjr8psi79hr8ms03]
yandex_compute_instance.vm: Still creating... [50s elapsed]
yandex_compute_instance.vm: Creation complete after 51s [id=fhm8khehrnh148g0iguf]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

vm_details = {
  "vm" = {
    "external_ip" = "51.250.79.42"
    "fqdn" = "netology-develop-platform-web.sypchik.local"
    "name" = "netology-develop-platform-web"
  }
  "vm-b" = {
    "external_ip" = "89.169.141.147"
    "fqdn" = "netology-develop-platform-db.sypchik.local"
    "name" = "netology-develop-platform-db"
  }
}

sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/02/src$ ssh ubuntu@51.250.79.42
The authenticity of host '51.250.79.42 (51.250.79.42)' can't be established.
ED25519 key fingerprint is SHA256:F2pJOlfIvfZTan/xp4ZHM0+CEuEgo+t704SII0IR8Wo.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '51.250.79.42' (ED25519) to the list of known hosts.
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-193-generic x86_64)
....
Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.
....

ubuntu@fhm8khehrnh148g0iguf:~$ curl ifconfig.me
51.250.79.42
ubuntu@fhm8khehrnh148g0iguf:~$
```

preemptible = true - Указывает что машина бедет отключена через какое-то время

core_fraction = 5 - Устанавливает долю ревурсов ядра CPU


```
![image](https://github.com/user-attachments/assets/c4af98ba-f5d7-401f-84b3-552fdcc3eff0)
```


Задача 3

![image](https://github.com/user-attachments/assets/a607f414-6749-4863-a5cd-d02b8091dc4b)

```
vm_details = {
  "vm" = {
    "external_ip" = "89.169.133.138"
    "fqdn" = "netology-develop-platform-web.sypchik.local"
    "name" = "netology-develop-platform-web"
  }
  "vm-b" = {
    "external_ip" = "89.169.168.212"
    "fqdn" = "netology-develop-platform-db.sypchik.local"
    "name" = "netology-develop-platform-db"
  }
}
```

Задача 4

```
terraform output
vm_details = {
  "vm" = {
    "external_ip" = "89.169.133.138"
    "fqdn" = "netology-develop-platform-web.sypchik.local"
    "name" = "netology-develop-platform-web"
  }
  "vm-b" = {
    "external_ip" = "89.169.168.212"
    "fqdn" = "netology-develop-platform-db.sypchik.local"
    "name" = "netology-develop-platform-db"
  }
}
```
