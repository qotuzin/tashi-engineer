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

A continuously evolving home laboratory built around TrueNAS, Docker, and a carefully designed network. The lab hosts personal services, development environments, monitoring, and this portfolio website itself.

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

The portfolio container is deliberately simple: it only serves static files on a local port. DNS, TLS, reverse proxy, and WAN exposure are handled outside this project.

## Key Decisions

- Prefer static, rebuildable services where possible
- Keep application containers focused on a single responsibility
- Document topology and recovery procedures
- Treat infrastructure as a first-class engineering project

## Lessons

Running real services at home quickly surfaces issues around backups, updates, observability, and failure modes. These lessons transfer directly to professional systems work.

## Related Writing

See blog posts on TrueNAS setup and infrastructure notes.
