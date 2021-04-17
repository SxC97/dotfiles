# -*- coding: utf-8 -*-

import os
import ConfigParser
import time
import socket
import subprocess

import alfred


def tcp_port_status(host, port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(1)
    try:
        s.connect((host, int(port)))
        s.shutdown(2)
        return True
    except:
        return False


def tcp_port_ping(host, port):
    t = time.time()
    if tcp_port_status(host, port):
        diff = time.time() - t
        return True, diff
    return False, None


class PingportWorkflow(alfred.AlfredWorkflow):
    _reserved_words = []

    def __init__(self, max_results=20):
        self.max_results = max_results

    def command_autocomplete_iter(self, query):
        args = query.rstrip().split()
        if len(query.lstrip()) and query[-1] == ' ':
            args.append('')
        if len(args) in (0, 1):
            valids = 0
            for host in ('localhost', '127.0.0.1'):
                item = self.item(title=host,
                                 description='pingport {} ...'.format(host),
                                 uid=host,
                                 autocomplete=True, arg='{} '.format(host),
                                 match=query, ignore=True)
                if item:
                    valids += 1
                    yield item
            if not valids:
                yield self.item(title=query,
                                uid=query,
                                description='pingport {} ...'.format(query),
                                autocomplete=False, arg=query, ignore=True)
        elif len(args) == 2:
            valids = 0
            for port in (22, 80, 443):
                sub_query = '{} {}'.format(args[0], port)
                item = self.item(title=sub_query,
                                 uid=sub_query,
                                 description='pingport {}'.format(sub_query),
                                 autocomplete=True, arg='{} '.format(sub_query),
                                 match=query, ignore=True)
                if item:
                    valids += 1
                    yield item
            if not valids:
                yield self.item(title=query,
                                uid=query,
                                description='pingport {}'.format(query),
                                autocomplete=True, arg='{} '.format(query),
                                ignore=True)
        elif len(args) == 3:
            host, port = args[:2]
            status, latency = tcp_port_ping(host, port)
            if status:
                description = '{}:{} TCP port replied in ' \
                '{:.2f}ms.'.format(host, port, latency * 1000)
                yield self.item(title=query, uid=query,
                                description=description, autocomplete=True,
                                arg=query, match=query, ignore=True)
            else:
                description = '{}:{} TCP port is closed.'.format(host, port)
                yield self.item(title=query, uid=query,
                                description=description, autocomplete=True,
                                arg=query, match=query, ignore=True)


    def do_command_autocomplete(self, query):
        self.write_items(self.command_autocomplete_iter(query))


def main(action, query):
    pingport = PingportWorkflow()
    pingport.route_action(action, query)


if __name__ == "__main__":
    main(action=alfred.args()[0], query=alfred.args()[1])
