FROM gitpod/workspace-full:latest

# 安装 SDKMAN 并使用它安装 Java 21, Maven 和 Gradle
RUN curl -s "https://get.sdkman.io" | bash && \
    bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk install java 21.0.2-amzn" && \
    bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk install maven" && \
    bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk install gradle"

# 设置环境变量
ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/current
ENV MAVEN_HOME=/home/gitpod/.sdkman/candidates/maven/current
ENV GRADLE_HOME=/home/gitpod/.sdkman/candidates/gradle/current
ENV PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin:$PATH

# 验证安装
RUN java -version
RUN mvn -version
RUN gradle -version
