package com.abs.util;

import org.apache.log4j.Logger;

public class Log4jUtil {

	/************************************************************************
	*
	* get
	*
	*************************************************************************/
	public static Logger getLogger() {
		final String className = new Throwable().getStackTrace()[1].getClassName();
		return Logger.getLogger(className);
	}

	/************************************************************************
	*
	*  StartLog
	*
	*************************************************************************/
	public static void infoStartLog(
				final Logger logger, final String message) {
		logger.info(">> " + message + " :: start.");
	}

	/************************************************************************
	*
	*  EndLog
	*
	*************************************************************************/
	public static void infoFinishLog(
				final Logger logger, final String message) {
		logger.info("<< " + message + " :: finish.");
	}
}
