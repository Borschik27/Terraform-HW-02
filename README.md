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



![image](https://github.com/user-attachments/assets/c4af98ba-f5d7-401f-84b3-552fdcc3eff0)



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

Задача 5

```
 terraform apply -auto-approve
data.yandex_compute_image.my_image: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enpr6r0hiok6giodjp67]
data.yandex_compute_image.my_image: Read complete after 0s [id=fd8ivkpagklognhslumh]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bj126sulk5o2c1r3hf]
yandex_vpc_subnet.develop-b: Refreshing state... [id=e2lvssbtehgpf9clav7r]
yandex_compute_instance.vm: Refreshing state... [id=fhmb6r7k98jqpf49lomk]
yandex_compute_instance.vm-b: Refreshing state... [id=epdu3tg2p63lu3kf0l9i]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.vm will be updated in-place
  ~ resource "yandex_compute_instance" "vm" {
        id                        = "fhmb6r7k98jqpf49lomk"
      ~ name                      = "netology-develop-platform-web" -> "hw-dev-u-cp-cp01"
        # (14 unchanged attributes hidden)

        # (6 unchanged blocks hidden)
    }

  # yandex_compute_instance.vm-b will be updated in-place
  ~ resource "yandex_compute_instance" "vm-b" {
        id                        = "epdu3tg2p63lu3kf0l9i"
      ~ name                      = "netology-develop-platform-db" -> "hw-dev-u-db-db001"
        # (14 unchanged attributes hidden)

        # (6 unchanged blocks hidden)
    }

Plan: 0 to add, 2 to change, 0 to destroy.

Changes to Outputs:
  ~ vm_details = {
      ~ vm   = {
          ~ fqdn        = "netology-develop-platform-web.sypchik.local" -> "hw-dev-u-cp-cp01.sypchik.local"
          ~ name        = "netology-develop-platform-web" -> "hw-dev-u-cp-cp01"
            # (1 unchanged attribute hidden)
        }
      ~ vm-b = {
          ~ fqdn        = "netology-develop-platform-db.sypchik.local" -> "hw-dev-u-db-db001.sypchik.local"
          ~ name        = "netology-develop-platform-db" -> "hw-dev-u-db-db001"
            # (1 unchanged attribute hidden)
        }
    }
yandex_compute_instance.vm-b: Modifying... [id=epdu3tg2p63lu3kf0l9i]
yandex_compute_instance.vm: Modifying... [id=fhmb6r7k98jqpf49lomk]
yandex_compute_instance.vm: Modifications complete after 5s [id=fhmb6r7k98jqpf49lomk]
yandex_compute_instance.vm-b: Modifications complete after 7s [id=epdu3tg2p63lu3kf0l9i]

Apply complete! Resources: 0 added, 2 changed, 0 destroyed.

Outputs:

vm_details = {
  "vm" = {
    "external_ip" = "89.169.133.138"
    "fqdn" = "hw-dev-u-cp-cp01.sypchik.local"
    "name" = "hw-dev-u-cp-cp01"
  }
  "vm-b" = {
    "external_ip" = "89.169.168.212"
    "fqdn" = "hw-dev-u-db-db001.sypchik.local"
    "name" = "hw-dev-u-db-db001"
  }
}
```

Задача 6

Вывод о создании ВМ с помощью группировки параметров

```
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

vm_details = {
  "db" = {
    "cores" = 2
    "ip" = "51.250.110.76"
    "memory" = 4
    "metadata" = tomap({
      "serial-port-enable" = "1"
      "ssh-keys" = "ubuntu:ssh-rsa AAAAB3N sypchik@Mirror"
    })
    "name" = "db"
  }
  "web" = {
    "cores" = 2
    "ip" = "51.250.6.191"
    "memory" = 2
    "metadata" = tomap({
      "serial-port-enable" = "1"
      "ssh-keys" = "ubuntu:ssh-rsa AAAAB3 sypchik@Mirror"
    })
    "name" = "web"
  }
}
```

![image](https://github.com/user-attachments/assets/b0e5922c-2390-4f86-b29b-b530be34e4d5)


![image](https://github.com/user-attachments/assets/76ba3eeb-4e3d-4147-b493-4bd503fd5d48)



Задание 7

```
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/02/src$ terraform console
> local.test_list[*]
[
  "develop",
  "staging",
  "production",
]
> local.test_list[1]
"staging"
> length(local.test_list)
3
> local.test_map["admin"]
"John"
> "${local.test_map["admin"]} is ${keys(local.test_map)[0]} for ${keys(local.servers)[1]} server based on OS ${local.servers.production["image"]} with ${local.servers.production["cpu"]} vcpu, ${local.servers.production["ram"]} ram and ${length(local.servers.production["disks"])} virtual disks"
"John is admin for production server based on OS ubuntu-20-04 with 10 vcpu, 40 ram and 4 virtual disks"
>
```

Задание 8

```
> var.test[0]["dev1"][0]
"ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117"
```

Задание 9

![image](https://github.com/user-attachments/assets/dbe91dc4-c363-4728-83f5-7d598937b1e6)
