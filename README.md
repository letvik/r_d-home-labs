Згідно з завдання створена така структура:

kustomization.yaml
namespace.yaml
deployment.yaml
service.yaml
configmap.yaml
secret.yaml
pv.yaml
pvc.yaml

Для запуску мінікуба виконуємо: minikube start.

Переходимо в папку з файлами і виконуємо: k apply -k .
![lab19_k-k](https://github.com/user-attachments/assets/c0882f98-5ff4-4539-912d-8d2ace2c44ba)

Ця команда запускає маніфести з kustomization.yaml

Для зупинки мінікуба запускаємо minikube stop

Перевірка і логи команд

k get all -n my-namespace
![lab19](https://github.com/user-attachments/assets/ef3dbb0b-b455-4ab2-8584-a5e989434d54)

k get pods -n my-namespace
![lab19_pods](https://github.com/user-attachments/assets/63474f72-9bbc-4688-9835-504273818629)

k get pods -n my-namespace -o wide
![lab19_pods_wide](https://github.com/user-attachments/assets/fca8fb6a-11b5-400d-b52d-55e4a6c04d5c)

k logs 
![lab19_pod_logs](https://github.com/user-attachments/assets/0cc33c09-65b6-4014-95a0-d93f05db5b18)

k describe svc my-nginx-service -n my-namespace
![lab19_service](https://github.com/user-attachments/assets/af9e87e8-289d-4f7d-8466-8782db573826)

k get pv
![lab19_k_get_pv](https://github.com/user-attachments/assets/4175de6a-b615-478f-88e7-7fc37725052d)

k get pvc -n my-namepspace
![lab19_pv](https://github.com/user-attachments/assets/6bd870e4-71f2-4b7e-86c9-aa77ae7bc6c7)


![lab19_env](https://github.com/user-attachments/assets/e6fe19e2-5835-4f98-accb-fa1a244bba34)



   



