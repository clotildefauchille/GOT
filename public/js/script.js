const app = {
    init: () => {
        //sélectionner tous les éléments de la class .menu

        //pour chaque élément, ajouter un EventListener sur l'événement mouseover
        //lorsque cet événement se produit, appeler la méthode app.setSubMenu
    },

    setSubMenu: event => {
        //récupérer tous les éléments de la class .details et les cacher

        const bounds = app.bounds(event.target);
        
        //sélectionner le bon élément en s'aidant de l'object event 
        const subMenu = null;
        subMenu.style.top = '78px';
        subMenu.style.left = (bounds.left)+'px';

        //afficher l'élément subMenu

        //lui ajouter un EventListener sur l'événement mouseleave
        //lorsque cet événement se produit, déclencher une fonction anonyme qui appellera app.hide(subMenu)
    },

    show: element => {
        element.style.opacity = 1;
        element.style.zIndex = 1;
    },

    hide: element => {
        element.style.opacity = 0;
        element.style.zIndex = -1;
    },

    bounds: element => element.getBoundingClientRect()
};

document.addEventListener('DOMContentLoaded', app.init);
