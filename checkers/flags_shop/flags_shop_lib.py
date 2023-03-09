#!/usr/bin/env python3

import requests

from checklib import *

PORT = 9876

class CheckMachine:
	def __init__(self, checker):
		self.checker = checker

	def ping(self):
		r = requests.get(f'http://{self.checker.host}:{PORT}/', timeout=2)
		self.checker.check_response(r, 'Check failed')

	def put_flag(self, flag_id, flag, vuln):
		password = rnd_string(16)
		new_flag_id = f'{flag_id},{password}'
		r = requests.get(f'http://{self.checker.host}:{PORT}/put_flag/{flag_id}/{password}/{flag}', timeout=2)
		self.checker.check_response(r, 'Could not put flag')
		return new_flag_id

	def get_flag(self, new_flag_id, vuln):
		flag_id, password = new_flag_id.split(',')
		r = requests.get(f'http://{self.checker.host}:{PORT}/get_flag/{flag_id}/{password}', timeout=2)
		self.checker.assert_in('Flag:', r.text, 'Could not get flag', status=Status.CORRUPT)
		return r.text.split()[1]

