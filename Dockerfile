FROM centos:7                //基础镜像（就像继承的父类）
RUN yum -y install gcc make pcre-devel zlib-devel tar zlib    //运行的命令：安装gcc
ADD nginx-1.23.1.tar.gz /usr/src/      //将此.tar.gz文件复制到虚拟机的文件中
RUN cd /usr/src/nginx-1.23.1\          //进入指定目录
    && mkdir /usr/local/nginx \        //创建文件夹
    && ./configure --prefix=/usr/local/nginx && make && make install \       
    //将软件安装在/usr/local/nginx下，编译，安装到常用位置
    && ln -s /usr/local/nginx/sbin/nginx /usr/local/sbin/ \
    //连接两个文件，可以实现同步变化
    && nginx
    //呃呃，教程里有的，感觉不是必须的吧 

RUN rm -rf /usr/src/nginx--1.23.1      //强制删除容器
EXPOSE 80                              //暴露端口
CMD nginx	
