<?php

namespace Killerwolf\Bundle\CyclocityBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('KillerwolfCyclocityBundle:Default:index.html.twig', array('name' => $name));
    }
}
