№22. AWS Basics
1. Створення та налаштування VPC
Створив приватну мережу 10.0.0.0.24 за допомогою CloudShell. Використовував команду:

**aws ec2 create-vpc --cidr-block 10.0.0.0/24 --tag-specifications ResourceType=vpc,Tags=[{Key=Name,Value=my-vpc-r-d}]****
![vpc-create2](https://github.com/user-attachments/assets/a113371a-d972-4f2b-92e7-e0e372fec8d2)

![vpc-resource-map](https://github.com/user-attachments/assets/ae8a78de-a9be-4b93-a719-14659d9b82a1)

* Створіть дві підмережі в VPC:
Для створення підмереж в клауді перейшов в VPC >> Subnets >> Create Subnet >> вибрав приватну мережу

![subnets](https://github.com/user-attachments/assets/ae37c691-01f8-4fd4-988b-0f1a3a55f684)


* Створіть та налаштуйте інтернет-шлюз (Internet Gateway):
* Для створення перейшов у VPC >> Internet Gateways >> Create internet geteway
* ![ig](https://github.com/user-attachments/assets/63a7928e-20f6-4b97-817b-7534b1ded3d7)
* ![ig-2](https://github.com/user-attachments/assets/d5e02bee-420b-414e-a4ed-a9789fc4e03f)

Щоб привʼязати шлюз до мережі треба його зазначити і вибрати Actions >> Attach to VPC
Для створення таблиці маршрутизації треба перейти в VPC >> Route tables >> Create route table

![rt](https://github.com/user-attachments/assets/d09adee2-572c-4541-9591-319ee5d65368)
![rt-2](https://github.com/user-attachments/assets/cefc9ad7-c8a1-43f5-9e6f-b2e8fec53dc4)
![rt-3](https://github.com/user-attachments/assets/f1f0b284-18af-4920-aff8-48a3915319d7)
![rt-4](https://github.com/user-attachments/assets/5cdd9044-d457-4dbf-a098-cc2fff8779e3)
![rt-5](https://github.com/user-attachments/assets/15d65ff7-f081-4cdd-a91e-f17ff8905421)


2. Налаштування груп безпеки (Security Groups) та списків контролю доступу (ACL)

   
Для створення і налаштування SG i ACL переходимо в VPC >> Network ACLs / Security Groups

![ACL](https://github.com/user-attachments/assets/60a29c54-a9e4-4a47-be21-9e791f203646)
![sg](https://github.com/user-attachments/assets/186b2a57-c8aa-4b16-9b79-ed3653d08019)
![sg2](https://github.com/user-attachments/assets/79f3c9be-3200-4ff0-81e6-89f3e98d2f7e)

4. Запуск інстансу EC2
Щоб створити інстанс треба перейти в EC2 >> Launch Instance
Далі треба вказати всі базові необхідні параметри (OS, SG, Region)

![ec2](https://github.com/user-attachments/assets/87f679ad-5cde-4625-9a02-7a28fa74ba96)
![ec2-2](https://github.com/user-attachments/assets/20676a8c-64af-4a9e-8067-6776bf58c61a)
![ec2-live](https://github.com/user-attachments/assets/80da03d3-a6dd-47de-a22f-d578e0cfa0ed)

5. Призначення еластичної IP-адреси (EIP)
В CloudShell створив EIP і привʼязав його до інстансу.

aws ec2 allocate-address
![EIP_console](https://github.com/user-attachments/assets/e25bcee2-081a-49cc-9887-7e8bb6546f8b)

В консолі зробив привʼязку.
aws ec2 associate-address --instance-id i-0801b6f3a566593a3 --allocation-id eipalloc-088327d6d8de1b5b7
![EIP EC2](https://github.com/user-attachments/assets/ba88c6f6-105b-4243-ac82-b79df798733f)
![EIP-UI](https://github.com/user-attachments/assets/d0fc159c-03b0-4094-900f-9e1977333d51)

EIP
![EC2_EIP_UI](https://github.com/user-attachments/assets/6ab386d7-acbe-4e5c-9e0b-bf3365a719db)
![EC2_EIP_LIVE](https://github.com/user-attachments/assets/27df47fc-4247-4ae9-8e50-52f184906f97)


