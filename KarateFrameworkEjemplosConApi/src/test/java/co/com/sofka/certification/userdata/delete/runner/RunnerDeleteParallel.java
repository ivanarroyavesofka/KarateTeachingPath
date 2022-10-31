package co.com.sofka.certification.userdata.delete.runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class RunnerDeleteParallel {
    @Test
    void testParallel() {
        Results results = Runner
                .path("classpath:co/com/sofka/certification/userdata/delete/delete-user-other-example.feature")
                .tags("~@ignore")
                .relativeTo(getClass())
                .outputCucumberJson(true)
                .karateEnv("QA")
                .parallel(Runtime.getRuntime().availableProcessors());

        assertEquals(0, results.getFailCount(), results.getErrorMessages());

        generateCucumberReport(results.getReportDir());
    }

    public static void generateCucumberReport(String karateOutputPath){
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "curso_karate");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
