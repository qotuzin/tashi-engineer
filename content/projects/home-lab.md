+++
title = "Home Lab Infrastructure"
description = "TrueNAS, Docker, networking, monitoring, and self-hosting platform"
weight = 3
[extra]
role = "Designer & operator"
year = "Ongoing"
status = "Active"
tags = ["TrueNAS", "Docker", "Networking", "Self-hosting"]
image = "images/projects/home-lab/home-lab.jpg"
+++

## Overview

A continuously evolving homelab built with TrueNAS, Docker, Pangolin, and a carefully designed network. The lab hosts personal services, development environments, monitoring, and this portfolio website itself.

## Goals

- Reliable self-hosted services
- Clean separation of concerns (storage, compute, networking, exposure)
- Observability and straightforward maintenance
- A platform that supports learning in systems engineering and infrastructure

## Architecture Highlights

| Layer | Technology / Approach |
|-------|------------------------|
| Storage & VMs / Apps | TrueNAS |
| Containers | Docker / Compose |
| Networking | Segmented networks, reverse proxy |
| Public exposure | Pangolin tunnel infrastructure (external) |
| Monitoring | (as configured) |
