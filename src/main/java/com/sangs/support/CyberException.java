package com.sangs.support;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;

@SuppressWarnings("serial")
public class CyberException extends EgovBizException {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    public CyberException() {
    }

    public CyberException(String msg) {
    }

    public CyberException(Exception e) {
    }
}
