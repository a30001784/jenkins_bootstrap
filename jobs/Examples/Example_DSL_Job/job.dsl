#!/usr/bin/env groovy

freeStyleJob(jobName) {
    logRotator {
        daysToKeep(2)
    }

    parameters {
        choiceParam('AWESOME_LEVEL',
                    ['Good','Great','Awesome','Fully sick'],
                    'How awesome is this job?')
    }

    scm {
        git {
            remote {
                url("https://github.com/a30001784/jenkins_bootstrap.git")
                credentials("github_formal")
            }
            branch("master")
        }
    }

    steps {
        shell('echo This job is ${AWESOME_LEVEL}!!!!')
    }
}