# Docker take notes
## Lệnh cơ bản trong docker
- Check container:
> docker ps -a

- Check image:
> docker images

- Khởi chạy container:
> docker  start <name/ID-container>

- Tạo container từ image:
> docker run -it <name/ID-image>
  
- Trở lại container đang chạy:
> docker attach <name/ID-container>

- Kiểm tra docker đang chạy:
> docker ps

- Thoát container nhưng vẫn muốn để container tiếp tục chạy:
> Nhất tổ hợp ctr+p -> ctr+q

- Ép docker dừng chạy ở ngoài:
> docker stop <name/ID-container>

- **Xóa** container - khi container ko chạy:
> docker rm <name container>
  
- **Xóa** container - khi container đang chạy:
> docker rm -f <name container>
  
- Đứng ở ngoài, thi hành lệnh bên trong conteiner:
> docker exec <name-container> <lệnh>
 
- Lưu container thành image: (trước khi lưu container (commit) thì container phải ở trạng thái là exited (dừng lại))
> docker commit <name-container> <name image>
  
- Lưu image thành file
> docker save --output <name-myimage>.tar <ID/name-image-readly>
  
- Xóa docker image:
> docker image rm <ID image> -f
  
- Load image từ file:
> docker load -i <name-myimage>.tar 
  
- Đặt tên và tag cho image:
> docker tag <ID image> <Tên muốn đặt>
  
## Chia sẻ dữ liệu host-container hoặc container-container

- Chia sẻ dữ liệu giữa host-container:
> docker run -it -v <thư mục trên máy host>:<thư mục trên container> <ID-image>

- Chia sẻ dữ liệu container-container
> docker run -it --name <name-container B> --volumes-from <name-container A> <image-name>
  
- Chia sẻ dữ liệu thông qua ổ đĩa:
  - B1: tạo ổ đĩa
  - B2: gán ổ đĩa vào container
> docker volume ls
  
> docker volume create <tên ổ đĩa>

> docker run -it --name <name container> --mount source:<tên ổ đĩa>,taget=<thư mục ở container> <ID image>
