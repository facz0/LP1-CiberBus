package com.ciberbus;

import java.io.File;
import org.apache.catalina.WebResourceRoot;
import org.apache.catalina.core.StandardContext;
import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.DirResourceSet;
import org.apache.catalina.webresources.StandardRoot;

public class Launcher {
    public static void main(String[] args) throws Exception {
        int port = 8080;
        String portEnv = System.getenv("PORT");
        if (portEnv != null && !portEnv.trim().isEmpty()) {
            try {
                port = Integer.parseInt(portEnv.trim());
            } catch (NumberFormatException ignored) {}
        }

        Tomcat tomcat = new Tomcat();
        tomcat.setPort(port);

        // Directorio temporal de trabajo para Tomcat
        File baseDir = new File("target/tomcat-work");
        if (!baseDir.exists()) {
            baseDir.mkdirs();
        }
        tomcat.setBaseDir(baseDir.getAbsolutePath());

        // Inicializar el conector HTTP
        tomcat.getConnector();

        // Carpeta base de recursos web (JSP, CSS, WEB-INF/web.xml)
        File webappDir = new File("src/main/webapp");
        if (!webappDir.exists()) {
            throw new IllegalStateException("No se encontró el directorio webapp en: " + webappDir.getAbsolutePath());
        }

        String contextPath = "/LPI_CiberBus";
        StandardContext ctx = (StandardContext) tomcat.addWebapp(contextPath, webappDir.getAbsolutePath());

        // Permitir que el contexto use el ClassLoader de la aplicación
        ctx.setParentClassLoader(Launcher.class.getClassLoader());

        // Montar las clases compiladas (Servlets, DAOs, Entidades) en /WEB-INF/classes
        File classesDir = new File("target/classes");
        if (classesDir.exists()) {
            WebResourceRoot resources = new StandardRoot(ctx);
            resources.addPreResources(new DirResourceSet(
                resources,
                "/WEB-INF/classes",
                classesDir.getAbsolutePath(),
                "/"
            ));
            ctx.setResources(resources);
        }

        System.out.println("===============================================================");
        System.out.println("  🚀 CiberBus - Servidor Tomcat Embebido iniciado con éxito");
        System.out.println("  🌐 URL: http://localhost:" + port + contextPath + "/");
        System.out.println("  Presiona Ctrl+C en esta terminal para detener el servidor.");
        System.out.println("===============================================================");

        tomcat.start();
        tomcat.getServer().await();
    }
}
