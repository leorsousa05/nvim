return {
    'javiorfo/nvim-wildcat',
    lazy = true,
    cmd = { "WildcatRun", "WildcatUp", "WildcatServer" },
    ft = { "java" },
    event = { "BufReadPost pom.xml", "BufReadPost build.gradle" },
    dependencies = { 'javiorfo/nvim-popcorn', 'javiorfo/nvim-spinetta' },
    opts = {

        console_size = 15,

        default_server = "tomcat",

        build_tool = "maven",

        java_home = "C:\\Program Files\\Java\\jdk-21",

        tomcat = {
            path = "C:\\Users\\guilh\\apache-tomcat",
            app_base = "webapps",
        }
    }
}
