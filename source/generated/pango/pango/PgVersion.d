module pango.PgVersion;

private import glib.Str;
private import glib.c.functions;
private import pango.c.functions;
public  import pango.c.types;


/** */
public struct PgVersion
{

	/**
	 * Returns the encoded version of Pango available at run-time.
	 *
	 * This is similar to the macro %PANGO_VERSION except that the macro
	 * returns the encoded version available at compile-time. A version
	 * number can be encoded into an integer using PANGO_VERSION_ENCODE().
	 *
	 * Returns: The encoded version of Pango library available at run time.
	 *
	 * Since: 1.16
	 */
	public static int version_()
	{
		return pango_version();
	}

	/**
	 * Checks that the Pango library in use is compatible with the
	 * given version.
	 *
	 * Generally you would pass in the constants %PANGO_VERSION_MAJOR,
	 * %PANGO_VERSION_MINOR, %PANGO_VERSION_MICRO as the three arguments
	 * to this function; that produces a check that the library in use at
	 * run-time is compatible with the version of Pango the application or
	 * module was compiled against.
	 *
	 * Compatibility is defined by two things: first the version
	 * of the running library is newer than the version
	 * @required_major.required_minor.@required_micro. Second
	 * the running library must be binary compatible with the
	 * version @required_major.required_minor.@required_micro
	 * (same major version.)
	 *
	 * For compile-time version checking use PANGO_VERSION_CHECK().
	 *
	 * Params:
	 *     requiredMajor = the required major version
	 *     requiredMinor = the required minor version
	 *     requiredMicro = the required major version
	 *
	 * Returns: %NULL if the Pango library is compatible
	 *     with the given version, or a string describing the version
	 *     mismatch.  The returned string is owned by Pango and should not
	 *     be modified or freed.
	 *
	 * Since: 1.16
	 */
	public static string versionCheck(int requiredMajor, int requiredMinor, int requiredMicro)
	{
		return Str.toString(pango_version_check(requiredMajor, requiredMinor, requiredMicro));
	}

	/**
	 * Returns the version of Pango available at run-time.
	 *
	 * This is similar to the macro %PANGO_VERSION_STRING except that the
	 * macro returns the version available at compile-time.
	 *
	 * Returns: A string containing the version of Pango library available
	 *     at run time. The returned string is owned by Pango and should not
	 *     be modified or freed.
	 *
	 * Since: 1.16
	 */
	public static string versionString()
	{
		return Str.toString(pango_version_string());
	}
}
