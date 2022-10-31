package co.com.sofka.certification.userdata.delete.runner;

import com.intuit.karate.junit5.Karate;

public class RunnerDelete {
    @Karate.Test
    Karate testSample() {
        return Karate
                .run("classpath:co/com/sofka/certification/userdata/delete/delete-user-other-example.feature")
                .tags("~@ignore")
                .relativeTo(getClass());
    }
}

