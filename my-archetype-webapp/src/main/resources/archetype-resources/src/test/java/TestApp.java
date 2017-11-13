package ${package};

import org.junit.Test;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class TestApp {
	 @Test
    public void test() {
        assertThat("hello world", is("hello world"));
    }
}
