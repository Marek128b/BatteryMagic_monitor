const runColorMode = (fn) => {
    if (!window.matchMedia) {
        return;
    }

    const query = window.matchMedia('(prefers-color-scheme: dark)');

    fn(query.matches);

    query.addEventListener('change', (event) => fn(event.matches));
}

runColorMode((isDarkMode) => {
    if (isDarkMode) {
        document.querySelector('body').classList.add('dark-mode');
    } else {
        document.querySelector('body').classList.remove('dark-mode');
    }
})