function loadGiscus() {
   // 1) Identify your container
   const giscusContainer = document.getElementById("giscus-container");
   if (!giscusContainer) return;

   // 2) Clear out any old Giscus instance
   giscusContainer.innerHTML = "";

   // 3) Pick the right theme URL
   const userTheme = localStorage.getItem("theme");
   const giscusTheme = (userTheme === "dark")
      ? "https://www.cesarsotovalero.net/css/giscus-dark.css"
      : "https://www.cesarsotovalero.net/css/giscus-light.css";

   // 4) Re-create the <script> tag with the chosen theme
   const script = document.createElement("script");
   script.src = "https://giscus.app/client.js";
   script.setAttribute("data-repo", "cesarsotovalero/cesarsotovalero.github.io");
   script.setAttribute("data-repo-id", "MDEwOlJlcG9zaXRvcnkyMzE2NzM0OTI=");
   script.setAttribute("data-category", "Announcements");
   script.setAttribute("data-category-id", "DIC_kwDODc8OlM4B-aMB");
   script.setAttribute("data-mapping", "pathname");
   script.setAttribute("data-reactions-enabled", "1");
   script.setAttribute("data-emit-metadata", "1");
   script.setAttribute("data-theme", giscusTheme);
   script.setAttribute("crossorigin", "anonymous");
   script.async = true;

   // 5) Append it to the container
   giscusContainer.appendChild(script);
}