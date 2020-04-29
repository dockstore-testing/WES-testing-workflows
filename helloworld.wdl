version 1.0

workflow helloworld {
    input {
      String greeting
    }
    call hello {
       input:
           greeting = greeting
     }

    meta {
        author : "Walt Shands"
        email : "jshands@ucsc.edu"
        description: "This is a hello world example"
     }
}

task hello {
    input {
      String greeting
    }
  command {
    echo "${greeting}"
  }
  runtime {
    # This docker container is not used by the workflow, but
    # Cromwell, the workflow engine used by DNAStack, requires the runtime
    # attribute "docker: .." defined for a task. Not doing so is technically
    # allowed in WDL, but will lead to very inconsistent behaviour as some
    #  engines will make a default, and many others will not.
    docker: "python"
  }
}
