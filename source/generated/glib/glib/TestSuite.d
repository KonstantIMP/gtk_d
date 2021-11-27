module glib.TestSuite;

private import glib.TestCase;
private import glib.c.functions;
public  import glib.c.types;
private import linker.loader;


/**
 * An opaque structure representing a test suite.
 */
public class TestSuite
{
	/** the main Gtk struct */
	protected GTestSuite* gTestSuite;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GTestSuite* getTestSuiteStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gTestSuite;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gTestSuite;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTestSuite* gTestSuite, bool ownedRef = false)
	{
		this.gTestSuite = gTestSuite;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GLIB[0]) && ownedRef )
			g_test_suite_free(gTestSuite);
	}


	/**
	 * Adds @test_case to @suite.
	 *
	 * Params:
	 *     testCase = a #GTestCase
	 *
	 * Since: 2.16
	 */
	public void add(TestCase testCase)
	{
		g_test_suite_add(gTestSuite, (testCase is null) ? null : testCase.getTestCaseStruct());
	}

	/**
	 * Adds @nestedsuite to @suite.
	 *
	 * Params:
	 *     nestedsuite = another #GTestSuite
	 *
	 * Since: 2.16
	 */
	public void addSuite(TestSuite nestedsuite)
	{
		g_test_suite_add_suite(gTestSuite, (nestedsuite is null) ? null : nestedsuite.getTestSuiteStruct());
	}

	/**
	 * Free the @suite and all nested #GTestSuites.
	 *
	 * Since: 2.70
	 */
	public void free()
	{
		g_test_suite_free(gTestSuite);
		ownedRef = false;
	}
}
