FROM ubuntu

ADD install.sh /
RUN bash -c "/install.sh" 


ENTRYPOINT service apache2 restart && bash
