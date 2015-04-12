CODE_DIR=/Users/dennisleon/code

alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
    export PATH=$JAVA_HOME/bin:$PATH
    java -version
}

p()
{
local project_looking_for project_found
project_looking_for=$1
project_found=$(find $CODE_DIR -name "$project_looking_for" -type d -maxdepth 1)

cd $project_found
}
_p() { _files -W $CODE_DIR -/; }
compdef _p p

idea () {
        local project_looking_for project_found
        project_looking_for=$1
        idea_version=15
        if [[ -e `pwd`/$project_looking_for ]]
        then
                open -a IntelliJ\ IDEA\ $idea_version -e `pwd`/$project_looking_for
        fi
        if [[ -e `pwd`/pom.xml && $project_looking_for = "pom.xml" ]]
        then
                open -a IntelliJ\ IDEA\ $idea_version -e `pwd`/pom.xml
        fi
        project_found=$(find $CODE_DIR -name "$project_looking_for" -type d -maxdepth 1)
        if [ -e $project_found/pom.xml ]
        then
                open -a IntelliJ\ IDEA\ $idea_version -e $project_found/pom.xml
        else
                idea_proj_file="`basename $project_found`.ipr"
                open -a IntelliJ\ IDEA\ $idea_version -e $project_found/$idea_proj_file
        fi
}

_idea() { _files -W $CODE_DIR -/; }
compdef _idea idea
