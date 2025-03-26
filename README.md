Lecture 4
1. VM1 (загальнодоступний вебсервер):

Спочатку ініціалізуємо в потрібній директорії vagrant init. 
В даній задачі, в vagrant файлі прописуємо параметри потрібної ВМ, а також вказуємо наш обраний гіпервайзер (OS: ubuntu/bionic64, 4GB RAM, 4vCPU, спільна папка shared, public network with dynamic IP). Такаж на гостьовій машинці запускаєио скрипт оновлення ОС і встановлення пакетів.
Далі запускаємо бокс командою vagrant up. Удаляємо бокс командою vagrant destroy. Вимикаємо ВМ за допомогою vagrant halt. 

<img width="1172" alt="vm1" src="https://github.com/user-attachments/assets/3f6aecdb-66cb-42e9-8b28-12374508963c" />
<img width="1008" alt="vm1__" src="https://github.com/user-attachments/assets/72d75bae-9afa-4bf2-8c35-307b3342ed9e" />

2. VM2 (приватний сервер):

Робимо анлогічно як і першу ВМ, тільки на generic/debian12 ОС, в приватній мережі і static IP.
<img width="1008" alt="vm2" src="https://github.com/user-attachments/assets/1f15a277-ff9a-4bc9-b0d6-0535ced18cf9" />

3.  VM3 (загальнодоступний сервер зі статичним IP):


Наступна ВМ створена аналогічно, як дві попередні, тільки з іншими параметрами згідно завданню.

<img width="1008" alt="vm3" src="https://github.com/user-attachments/assets/e4b1d3e3-9abf-4d71-82e3-e5942fb4d0e1" />


4. Додаткове завдання
   
В vagrant файлі створив три ВМ за допомогою циклку .each з аналогічними параметрами. Працює :)

<img width="1008" alt="vm*" src="https://github.com/user-attachments/assets/c848a08c-65de-4414-b374-e02314d1795d" />
<img width="1008" alt="vm***" src="https://github.com/user-attachments/assets/e7c0b242-1510-4037-94c6-1412b5031821" />
<img width="1088" alt="vm*_" src="https://github.com/user-attachments/assets/9d873e76-cb08-4795-b648-23542ca59e4a" />

