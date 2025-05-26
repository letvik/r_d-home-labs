Redis App.
Створив маніфест redis-statefulset.yaml згідно з завданням (дві репліки редіс з стабільними іменами)
![k get pods_](https://github.com/user-attachments/assets/7b774046-0cd1-44b7-afe0-4a3a9804219a)
![k get pods wide](https://github.com/user-attachments/assets/f7570871-0f21-4c3e-81ea-9aa6cb207166)

Перевіряємо що є створені PVC для зберігання данних
![k get pvc](https://github.com/user-attachments/assets/87fc858e-f6e8-483c-9232-64ddeeda68c3)

Підключився до поду, записав дані. Після видалення поду, створився новий і дані залишилися післа підключення.
![k exek pod](https://github.com/user-attachments/assets/9f9c38af-6126-479f-895e-3b51c1a8916e)
![k exec 2](https://github.com/user-attachments/assets/277aff9a-f3b4-4a80-98ba-9bc7bd083f8e)

![k delete pod](https://github.com/user-attachments/assets/6a5f2825-de74-4faa-9380-d4f7def3b931)


2: Налаштування Falco в Kubernetes за допомогою DaemonSet

Розгорнув Фалко згідно з вимог завдання, налаштував директорії і русерси, а також привілейований доступ (privileged: true).

Створив сервіс аккаунт в неймспейсі, бо без цього не хотіло запускатися...

apiVersion: v1
kind: ServiceAccount
metadata:
  name: falco
  namespace: kube-system

Запустив за допомогою: k apply -f falco-daemonset.yaml

Перевірка подів системному неймспейсі: k get pods -l app=falco -n kube-system
![2](https://github.com/user-attachments/assets/f7408254-1f4c-4e88-b00d-01665808d7e7)

k describe daemonset n=kube-system
![3](https://github.com/user-attachments/assets/c17afc45-fd23-4d41-ad2d-21748a601913)

Перегляд логів: kubectl logs -l app=falco -n kube-system
![4](https://github.com/user-attachments/assets/b9e1fab1-d2b6-4325-9986-333e9f657590)
