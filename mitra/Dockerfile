# Mitra layer on top of the image the upstream Dockerfile builds. It lives apart from the upstream
# files so that rebasing stable on a new upstream never conflicts here.
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BASE_ENTRYPOINT

# SpotBugs with Find Security Bugs covers part of the Java security rules the Community Build lacks.
ADD --chown=sonarqube:root --checksum=sha256:cb1e7abc015fa9e4bfcfc6661948820bd61895b0e841285641b1e5823849613e \
    https://github.com/spotbugs/sonar-findbugs/releases/download/4.7.0/sonar-findbugs-plugin-4.7.0.jar \
    /opt/sonarqube/lib/mitra-plugins/

COPY --chown=sonarqube:root --chmod=755 mitra/entrypoint.sh /opt/sonarqube/docker/mitra-entrypoint.sh

ENV MITRA_BASE_ENTRYPOINT=${BASE_ENTRYPOINT}
ENTRYPOINT ["/opt/sonarqube/docker/mitra-entrypoint.sh"]
