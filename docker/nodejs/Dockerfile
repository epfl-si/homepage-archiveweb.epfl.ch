# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, 2022.

FROM node:22-alpine

COPY bin/fill-archivedwebsites-json.js /
RUN chmod a+x /fill-archivedwebsites-json.js

VOLUME /public

CMD [ "node", "/fill-archivedwebsites-json.js" ]
