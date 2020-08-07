FROM lambgeo/lambda:gdal2.4-py3.7-geolayer

ENV PYTHONUSERBASE=/var/task

WORKDIR /tmp

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt --no-binary pydantic --user

# Reduce package size and remove useless files
RUN mv ${PYTHONUSERBASE}/lib/python3.7/site-packages/* ${PYTHONUSERBASE}/
RUN rm -rf ${PYTHONUSERBASE}/lib
RUN cd $PYTHONUSERBASE && zip -r9q /tmp/package.zip *

COPY app app
RUN zip -r9q /tmp/package.zip app