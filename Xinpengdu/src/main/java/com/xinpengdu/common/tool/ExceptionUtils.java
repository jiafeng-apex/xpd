package com.xinpengdu.common.tool;

import java.lang.reflect.InvocationTargetException;

/**
 * Created by jiafeng on 17/7/26.
 */
public final class ExceptionUtils {
    public static RuntimeException toUnchecked(Exception e) {
        return toUnchecked(e, "Unexpected Checked Exception");
    }

    public static RuntimeException toUnchecked(Exception e, String message) {
        if (e instanceof RuntimeException) {
            return (RuntimeException) e;
        } else if (e instanceof InvocationTargetException) {
            Throwable cause = e.getCause();
            return new RuntimeException(message, cause);
        } else {
            return new RuntimeException(message, e);
        }
    }

    private ExceptionUtils() {
    }
}
