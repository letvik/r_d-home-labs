№25. AWS EKS
Створив кластер а AWS за допомогою eksctl (попередньо встановив згідно документації):

![1](https://github.com/user-attachments/assets/78107198-1df9-42a8-aa7a-12677e3c28d5)



![2](https://github.com/user-attachments/assets/e06da41a-f0e7-4ad2-9dc4-dea465069830)

![3](https://github.com/user-attachments/assets/8555b13a-1e82-46af-9c26-115cd67f4ac8)

![4](https://github.com/user-attachments/assets/6bdeac49-18c3-44f4-a7fa-f959be6135ee)

eksctl автоматично підключив локальний kubectl до контексту з AWS.

![5](https://github.com/user-attachments/assets/6ea2145b-618b-438b-ad3f-9eb08040ad43)

Дивимось ноди

![6](https://github.com/user-attachments/assets/9b8b407c-9451-4e5b-8de8-cfbe59139e70)

Аплаїмо і перевіряємо ConfigMap для index.html
![7](https://github.com/user-attachments/assets/8ee0ad47-717c-4a87-bcfd-54b8afaa5bbd)

Аплаїмо Secret (API_KEY) і Deployment з NGINX. 
![8](https://github.com/user-attachments/assets/afe0624f-ae0a-403d-8c0a-9653511abf89)

![9](https://github.com/user-attachments/assets/77f6fdd6-47f3-4431-a883-429bf035e4f4)

![10](https://github.com/user-attachments/assets/3e1e98fb-12b6-41ac-b73c-0194fa227b57)

Дескрайбимо деплоймент

![11](https://github.com/user-attachments/assets/581a3505-6437-41bd-be43-cfe5f9b7bcb6)

Далі створюємо сервіс ЛоадБалансер
![12](https://github.com/user-attachments/assets/05f85af4-ad5a-44f2-be75-d6c371b16836)

Перевіряємо в браузері по адресі 

![13](https://github.com/user-attachments/assets/25f38f72-1b6b-426f-af49-75ca859164fb)

Створив PVC, але тут вийшла проблемка бо бракує йому прав і він не писав:( 

k apply -f pod-pvc.yaml
k get pod data-writer
k logs data-writer

драйвер додатково через консоль встановив і vbs volumes свторилися.

Чат підказує таке:
Сервіс‑акаунт драйвера не має прав ec2:CreateVolume.
UnauthorizedOperation: You are not authorized to perform: ec2:CreateVolume
Node Instance Role, що отримує Pod (eksctl‑…NodeInstanceRole…), не використовується драйвером.
EBS CSI Driver викликає AWS API від імені свого service account (ebs‑csi‑controller‑sa). Саме йому й потрібна IAM‑роль з політикою AmazonEBSCSIDriverPolicy.


Я не став правити як він мені розповів, чомусь стало стрьомно і не став лізти в "потрошки". Може якось інакше то треба обійти, чи зробити. 


 ![14](https://github.com/user-attachments/assets/20c4c46d-a64f-43af-9930-540dcef66a4c)
 
 ![15](https://github.com/user-attachments/assets/02d97435-a32e-433d-98ff-e3b8e3f5f578)
 
 ![19](https://github.com/user-attachments/assets/b6048c1d-152b-4871-a1de-685231f13202)
 
 ![20](https://github.com/user-attachments/assets/508f8745-606d-4bb6-9979-d50a30f89701)

Далі розгорнув тестовий застосунок Apache / NGINX, створив джоб і сервіс.
![16](https://github.com/user-attachments/assets/3f79bd71-65d0-4962-a150-ed5b9909ac4e)

![17](https://github.com/user-attachments/assets/071b248b-4a67-4ee3-a3ed-d40b096d2e58)

Був також створений окремий неймспейс dev з 5 репліками busybox. 
![18](https://github.com/user-attachments/assets/fa9aa321-f4dc-41e3-8e31-ecbd79f96e0f)








 













