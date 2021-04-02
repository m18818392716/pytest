cd D:\software\PycharmProject\web_conf_py\venv\Scripts
activate && cd .. && cd .. && pip install -r requirements.txt && pytest



case $deploy_env in
deploy)
     echo "deploy $deploy_env"
     mvn clean install -Dmaven.test.skip=true -Pqatest
     ;;
rollback)
     echo "rollback $deploy_env  version=$version"
     rm -rf cost-main-web/target/
     cp -R ${JENKINS_HOME}/jobs/costmain/builds/${version}/archive/cost-main-web/target  ./cost-main-web
     pwd && ls
     ;;
   *)
   exit
   ;;
esac