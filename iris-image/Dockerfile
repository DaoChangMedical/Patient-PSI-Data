ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:2023.1.1.380.0

FROM $IMAGE
USER irisowner
WORKDIR /dur

COPY --chown=irisowner:irisowner src /dur

RUN find . -name '.DS-Store' -type f -delete

#RUN /dur/loader.sh
RUN ISC_CPF_MERGE_FILE=/dur/merge/merge.cpf iris start $ISC_PACKAGE_INSTANCENAME && \
	iris session $ISC_PACKAGE_INSTANCENAME < /dur/iris.script && \
    iris stop $ISC_PACKAGE_INSTANCENAME quietly
# RUN iris start $ISC_PACKAGE_INSTANCENAME &&\
#     /dur/loader.sh