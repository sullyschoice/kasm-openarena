FROM kasmweb/core-ubuntu-noble:1.17.0-rolling-daily
USER root

ENV HOME=/home/kasm-default-profile
ENV STARTUPDIR=/dockerstartup
ENV INST_SCRIPTS=$STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

# Install Google Chrome
COPY ./src/openarena $INST_SCRIPTS/openarena/
RUN bash $INST_SCRIPTS/openarena/install_openarena.sh  && rm -rf $INST_SCRIPTS/openarena/

# Update the desktop environment to be optimized for a single application
#RUN cp $HOME/.config/xfce4/xfconf/single-application-xfce-perchannel-xml/* $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
#RUN cp /usr/share/backgrounds/bg_kasm.png /usr/share/backgrounds/bg_default.png
#RUN apt-get remove -y xfce4-panel


COPY ./src/openarena/custom_startup.sh $STARTUPDIR/custom_startup.sh
RUN chmod +x $STARTUPDIR/custom_startup.sh


######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME=/home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000