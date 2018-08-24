package stochastic.annotations;

import java.util.concurrent.TimeUnit;

/**
 * TODO: refactor this to use the new @m annotation introduced in Java <a href=
 * "http://types.cs.washington.edu/checker-framework/current/checker-framework-manual.html#units-checker"
 * >http://types.cs.washington.edu/checker-framework/current/checker-framework-
 * manual.html#units-checker</a>
 * 
 * @author crow
 * 
 *         ©2003-2017 by Stephen Crowley under the GNU GENERAL PUBLIC LICENSE
 *         Version 3, 29 June 2007
 */
public @interface Units
{
  TimeUnit time();
}
