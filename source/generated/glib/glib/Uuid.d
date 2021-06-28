module glib.Uuid;

private import glib.Str;
private import glib.c.functions;
public  import glib.c.types;


/** */
public struct Uuid
{

	/**
	 * Parses the string @str and verify if it is a UUID.
	 *
	 * The function accepts the following syntax:
	 *
	 * - simple forms (e.g. `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`)
	 *
	 * Note that hyphens are required within the UUID string itself,
	 * as per the aforementioned RFC.
	 *
	 * Params:
	 *     str = a string representing a UUID
	 *
	 * Returns: %TRUE if @str is a valid UUID, %FALSE otherwise.
	 *
	 * Since: 2.52
	 */
	public static bool stringIsValid(string str)
	{
		return g_uuid_string_is_valid(Str.toStringz(str)) != 0;
	}

	/**
	 * Generates a random UUID (RFC 4122 version 4) as a string. It has the same
	 * randomness guarantees as #GRand, so must not be used for cryptographic
	 * purposes such as key generation, nonces, salts or one-time pads.
	 *
	 * Returns: A string that should be freed with g_free().
	 *
	 * Since: 2.52
	 */
	public static string stringRandom()
	{
		auto retStr = g_uuid_string_random();

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
