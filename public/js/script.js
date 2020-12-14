const app = {
    init: () => {
        //sélectionner tous les éléments de la class .menu
        let menus = document.querySelectorAll(".menu");
        //pour chaque élément, ajouter un EventListener sur l'événement mouseover
        //lorsque cet événement se produit, appeler la méthode app.setSubMenu

        for (let menu of menus) {
            menu.addEventListener('mouseover', event => {
                app.setSubMenu;
                event.target.style.color = "orange";
            })
        }
    },

    setSubMenu: event => {
        //récupérer tous les éléments de la class .details et les cacher
        let details = document.querySelectorAll('.details');
        app.hide(details);
        const bounds = app.bounds(event.target);

        //sélectionner le bon élément en s'aidant de l'object event 
        const subMenu = null;
        subMenu.style.top = '78px';
        subMenu.style.left = (bounds.left) + 'px';

        //afficher l'élément subMenu
        app.show(subMenu);
        //lui ajouter un EventListener sur l'événement mouseleave
        subMenu.addEventListener('mouseleave', event => {
            event.target.style.color = "black";
        });

        //lorsque cet événement se produit, déclencher une fonction anonyme qui appellera app.hide(subMenu)
        () => {
            app.hide(subMenu)
        }
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