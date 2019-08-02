FROM mysql:5.7

# Set up env var
ENV HOME /
WORKDIR $HOME
COPY . $HOME

# run commands 
RUN ls && pwd 
#ADD init_db.sh init_db.sh
RUN /bin/bash -c "source init_db.sh"

