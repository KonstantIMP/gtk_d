module glib.Version;

private import glib.Str;
private import glib.c.functions;
public  import glib.c.types;


/** */
public struct Version
{

	/**
	 * Checks that the GLib library in use is compatible with the
	 * given version. Generally you would pass in the constants
	 * #GLIB_MAJOR_VERSION, #GLIB_MINOR_VERSION, #GLIB_MICRO_VERSION
	 * as the three arguments to this function; that produces
	 * a check that the library in use is compatible with
	 * the version of GLib the application or module was compiled
	 * against.
	 *
	 * Compatibility is defined by two things: first the version
	 * of the running library is newer than the version
	 * @required_major.required_minor.@required_micro. Second
	 * the running library must be binary compatible with the
	 * version @required_major.required_minor.@required_micro
	 * (same major version.)
	 *
	 * Params:
	 *     requiredMajor = the required major version
	 *     requiredMinor = the required minor version
	 *     requiredMicro = the required micro version
	 *
	 * Returns: %NULL if the GLib library is compatible with the
	 *     given version, or a string describing the version mismatch.
	 *     The returned string is owned by GLib and must not be modified
	 *     or freed.
	 *
	 * Since: 2.6
	 */
	public static string checkVersion(uint requiredMajor, uint requiredMinor, uint requiredMicro)
	{
		return Str.toString(glib_check_version(requiredMajor, requiredMinor, requiredMicro));
	}
}
